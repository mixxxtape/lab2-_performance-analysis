#include <iostream>
#include <iomanip>
#include <vector>
#include <cmath>
#include <algorithm>
#include <chrono>
#include <cstdlib>

#ifdef _WIN32
#define NOMINMAX       
#include <windows.h>     
#endif

using namespace std;

typedef vector<double> Vec;
typedef vector<double> Mat;  

#if defined(_MSC_VER)
#define NOINLINE __declspec(noinline)
#else
#define NOINLINE __attribute__((noinline))
#endif

static bool VERBOSE = false;

static double nowMs() {
    using namespace chrono;
    return duration<double, milli>(steady_clock::now().time_since_epoch()).count();
}

double normVec(const Vec& v) {   
    double m = 0;
    for (double t : v) m = max(m, fabs(t));
    return m;
}

double normMat(const Mat& A, int N) {   
    double m = 0;
    for (int i = 0; i < N; i++) {
        double s = 0;
        for (int j = 0; j < N; j++) s += fabs(A[(size_t)i * N + j]);
        m = max(m, s);
    }
    return m;
}

void makeSystem(int N, Mat& A, Vec& b) {
    A.assign((size_t)N * N, 0.0);
    b.assign(N, 0.0);
    if (N == 4) {
        double A4[4][4] = { {2, 1, 0, 0}, {1, 10, -5, 0}, {0, 1, -5, 2}, {0, 0, 1, 4} };
        double b4[4] = { -5, -9, -20, -27 };
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) A[i * 4 + j] = A4[i][j];
            b[i] = b4[i];
        }
        return;
    }
    for (int i = 0; i < N; i++) {
        A[(size_t)i * N + i] = 2.2;
        if (i > 0)     A[(size_t)i * N + i - 1] = 1.0;
        if (i < N - 1) A[(size_t)i * N + i + 1] = 1.0;
    }
    for (int i = 0; i < N; i++) {
        double s = 0;
        for (int j = 0; j < N; j++) s += A[(size_t)i * N + j] * (1.0 + sin(0.01 * j));
        b[i] = s;
    }
}

//  Метод прогонки
NOINLINE bool thomas(const Mat& A, const Vec& b, int N, Vec& y, double& det, double& log10det, int& sgn) {
    int n = N - 1;
    Vec a(N, 0.0), bb(N, 0.0), c(N, 0.0), f(N, 0.0);
    for (int i = 0; i < N; i++) {
        if (i > 0)     a[i] = A[(size_t)i * N + i - 1];
        if (i < N - 1) bb[i] = A[(size_t)i * N + i + 1];
        c[i] = -A[(size_t)i * N + i];
        f[i] = -b[i];
    }
    // достатні умови стійкості
    bool cond1 = true, cond2 = false, nz = (c[0] != 0 && c[n] != 0);
    for (int i = 0; i < N; i++) {
        double s = fabs(a[i]) + fabs(bb[i]);
        if (fabs(c[i]) < s) cond1 = false;
        if (fabs(c[i]) > s) cond2 = true;
    }
    for (int i = 1; i < n; i++)
        if (a[i] == 0 || bb[i] == 0) nz = false;
    if (VERBOSE)
        cout << "Умови прогонки: |c|>=|a|+|b|: " << cond1 << ", строга: " << cond2
        << ", ненульові: " << nz << "\n";
    if (!(cond1 && cond2 && nz)) return false;

    Vec al(N + 1, 0.0), be(N + 1, 0.0), z(N, 0.0);
    al[1] = bb[0] / c[0];
    be[1] = f[0] / c[0];
    for (int i = 1; i <= n; i++) {  // прямий хід
        z[i] = c[i] - al[i] * a[i];
        if (i < n) {
            al[i + 1] = bb[i] / z[i];
            be[i + 1] = (f[i] + a[i] * be[i]) / z[i];
        }
    }
    y.assign(N, 0.0);
    y[n] = (f[n] + a[n] * be[n]) / z[n]; // зворотний хід
    for (int i = n - 1; i >= 0; i--) y[i] = al[i + 1] * y[i + 1] + be[i + 1];

    det = -c[0];
    sgn = (det < 0) ? -1 : 1;
    log10det = log10(fabs(det));
    for (int i = 1; i <= n; i++) {
        det *= -z[i];
        if (-z[i] < 0) sgn = -sgn;
        log10det += log10(fabs(z[i]));
    }
    return true;
}

//  Метод Якобі
NOINLINE int jacobi(const Mat& A, const Vec& b, int N, double eps, Vec& x) {
    x.assign(N, 0.0);
    Vec xn(N, 0.0);
    int k = 0;
    double diff;
    do {
        diff = 0;
        for (int i = 0; i < N; i++) {
            const double* row = &A[(size_t)i * N];
            double s = 0;
            for (int j = 0; j < N; j++) s += row[j] * x[j];  
            s -= row[i] * x[i];             
            xn[i] = (b[i] - s) / row[i];
            diff = max(diff, fabs(xn[i] - x[i]));
        }
        x.swap(xn);
        k++;
        if (VERBOSE) cout << "  k=" << k << "  ||xk-xk-1|| = " << diff << "\n";
    } while (diff > eps && k < 100000);
    return k;
}

//  Метод Якобі лише по трьох діагоналях
NOINLINE int jacobiTri(const Mat& A, const Vec& b, int N, double eps, Vec& x) {
    Vec lo(N, 0.0), di(N, 0.0), up(N, 0.0);              // піддіагональ, діагональ, наддіагональ
    for (int i = 0; i < N; i++) {
        di[i] = A[(size_t)i * N + i];
        if (i > 0)     lo[i] = A[(size_t)i * N + i - 1];
        if (i < N - 1) up[i] = A[(size_t)i * N + i + 1];
    }
    x.assign(N, 0.0);
    Vec xn(N, 0.0);
    int k = 0;
    double diff;
    do {
        diff = 0;
        for (int i = 0; i < N; i++) {
            double s = 0;
            if (i > 0)     s += lo[i] * x[i - 1];
            if (i < N - 1) s += up[i] * x[i + 1];
            xn[i] = (b[i] - s) / di[i];
            diff = max(diff, fabs(xn[i] - x[i]));
        }
        x.swap(xn);
        k++;
    } while (diff > eps && k < 100000);
    return k;
}

//  Обернена матриця: Гаусс-Жордан
NOINLINE bool inverse(Mat A, int N, Mat& inv) {
    inv.assign((size_t)N * N, 0.0);
    for (int i = 0; i < N; i++) inv[(size_t)i * N + i] = 1.0;
    for (int k = 0; k < N; k++) {
        int l = k;
        for (int i = k + 1; i < N; i++)
            if (fabs(A[(size_t)i * N + k]) > fabs(A[(size_t)l * N + k])) l = i;
        if (fabs(A[(size_t)l * N + k]) < 1e-14) return false;
        if (l != k)
            for (int j = 0; j < N; j++) {
                swap(A[(size_t)k * N + j], A[(size_t)l * N + j]);
                swap(inv[(size_t)k * N + j], inv[(size_t)l * N + j]);
            }
        double d = A[(size_t)k * N + k];
        for (int j = 0; j < N; j++) { A[(size_t)k * N + j] /= d; inv[(size_t)k * N + j] /= d; }
        const double* __restrict Ak = &A[(size_t)k * N];
        const double* __restrict Ik = &inv[(size_t)k * N];
        for (int i = 0; i < N; i++) {
            if (i == k) continue;
            double m = A[(size_t)i * N + k];
            double* __restrict Ai = &A[(size_t)i * N];
            double* __restrict Ii = &inv[(size_t)i * N];
            for (int j = 0; j < N; j++) {         
                Ai[j] -= m * Ak[j];
                Ii[j] -= m * Ik[j];
            }
        }
    }
    return true;
}

NOINLINE double residual(const Mat& A, const Vec& b, const Vec& x, int N) {
    Vec r(N);
    for (int i = 0; i < N; i++) {
        double s = -b[i];
        for (int j = 0; j < N; j++) s += A[(size_t)i * N + j] * x[j];
        r[i] = s;
    }
    return normVec(r);
}

int main(int argc, char** argv) {
#ifdef _WIN32
    SetConsoleCP(65001);
    SetConsoleOutputCP(65001);
#endif
    int N = argc > 1 ? atoi(argv[1]) : 2000;
    int Ninv = argc > 2 ? atoi(argv[2]) : 600;
    double eps = argc > 3 ? atof(argv[3]) : (N == 4 ? 1e-4 : 1e-10);
    int mode = argc > 4 ? atoi(argv[4]) : 0;
    VERBOSE = (N <= 10);
    cout << fixed << setprecision(6);

    double t0 = nowMs();
    Mat A; Vec b;
    makeSystem(N, A, b);
    double tGen = nowMs() - t0;

    // 1. Прогонка
    t0 = nowMs();
    Vec yP; double det = 0, log10det = 0; int sgn = 1;
    bool okP = thomas(A, b, N, yP, det, log10det, sgn);
    double tP = nowMs() - t0;
    if (!okP) { cout << "Метод прогонки не застосовний\n"; return 1; }

    // 2. Якобі
    t0 = nowMs();
    Vec yJ;
    int iters = (mode == 1) ? jacobiTri(A, b, N, eps, yJ) : jacobi(A, b, N, eps, yJ);
    double tJ = nowMs() - t0;

    // 3. Порівняння
    Vec dd(N);
    for (int i = 0; i < N; i++) dd[i] = yP[i] - yJ[i];
    double dif = normVec(dd);
    double r1 = residual(A, b, yP, N), r2 = residual(A, b, yJ, N);

    // 4. Число обумовленості (на системі розміру min(N, Ninv))
    int M = min(N, Ninv);
    Mat AM, inv; Vec bM;
    t0 = nowMs();
    makeSystem(M, AM, bM);
    double tGenM = nowMs() - t0;
    t0 = nowMs();
    bool okI = inverse(AM, M, inv);
    double tInv = nowMs() - t0;
    t0 = nowMs();
    double cond = okI ? normMat(AM, M) * normMat(inv, M) : 0;
    double tCond = nowMs() - t0;

    if (VERBOSE) {
        cout << "Прогонка:\n";
        for (int i = 0; i < N; i++) cout << "  x" << i + 1 << " = " << yP[i] << "\n";
        cout << "Якобі:\n";
        for (int i = 0; i < N; i++) cout << "  x" << i + 1 << " = " << yJ[i] << "\n";
    }
    cout << scientific << setprecision(3);
    cout << "N = " << N << ", eps = " << eps << ", mode = " << mode << "\n";
    if (isfinite(det)) cout << "det A (прогонка)            = " << det << "\n";
    else cout << "det A (прогонка)            = " << (sgn < 0 ? "-" : "+") << "10^" << fixed << setprecision(2)
        << log10det << scientific << setprecision(3) << "  (double переповнюється)\n";
    cout << "Якобі: ітерацій             = " << iters << "\n";
    cout << "||x_прогонка - x_Якобі||    = " << dif << "\n";
    cout << "Нев'язка (прогонка / Якобі) = " << r1 << " / " << r2 << "\n";
    cout << "cond(A) для N=" << M << "          = " << (okI ? cond : -1.0) << "\n";
    cout << fixed << setprecision(2);
    cout << "Час, мс: генерація " << tGen + tGenM << ", прогонка " << tP << ", Якобі " << tJ
        << ", обернена " << tInv << ", cond " << tCond << "\n";
    return 0;
}