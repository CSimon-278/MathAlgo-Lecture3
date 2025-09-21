%% Task A1 – Finite Sequences → Polynomials
syms n z

% (a) i) x[n] = {1, 2, 5} at n = {0,1,2}
% X(z) = 1 + 2 * z^(-1) + 5 * z^(-2)
X1 = 1 + 2*z^(-1) + 5*z^(-2);
disp('X1(z) ='); pretty(X1);

% ii) x[n] = {0, 3, 0, 4} at n = {0,1,2,3}
% X(z) = 3 * z^(-1) + 4 * z^(-3)
X2 = 0 + 3*z^(-1) + 0*z^(-2) + 4*z^(-3);
disp('X2(z) ='); pretty(X2);

% (b) ROC explanation:
% Finite sequences behave nicely because their Z-transforms are polynomials in z^{-1},
% which converge everywhere in the complex plane except possibly at z = 0 or ∞.
% So, the ROC is the entire z-plane except those singularities.

%% Task A2 – Infinite Sequences & ROC
syms n z a
assume(abs(a) < 1)

% (a) x[n] = a^n u[n], a = 0.6
X_a = ztrans(0.6^n * heaviside(n), n, z);
disp('X(z) for a = 0.6:'); pretty(X_a);

% (b) x[n] = (-0.8)^n u[n]
X_b = ztrans((-0.8)^n * heaviside(n), n, z);
disp('X(z) for a = -0.8:'); pretty(X_b);

% (c) x[n] = -(0.9)^n u[-n-1]
X_c = ztrans(-1*(0.9)^n * heaviside(-n-1), n, z);
disp('X(z) for left-sided sequence:'); pretty(X_c);

% ROC explanation:
% The ROC depends on the convergence of the infinite sum. For right-sided sequences,
% ROC is |z| > |a| (outside the outermost pole). For left-sided, ROC is |z| < |a|.
% The ROC must not include any poles, and it defines where the Z-transform is valid.

%% Task A3 – Linearity & Shifting
syms n z

x1 = (0.5)^n * heaviside(n);
x2 = (-0.5)^n * heaviside(n);

% (a) Linearity: Z{2x1[n] − 3x2[n]}
X_lin = ztrans(2*x1 - 3*x2, n, z);
disp('Z{2x1[n] − 3x2[n]} ='); pretty(X_lin);

% (b) Time-shift: Z{x1[n−3]}
X_shift = ztrans(subs(x1, n, n-3), n, z);
disp('Z{x1[n−3]} ='); pretty(X_shift);

%% Task A4 – Inverse Z-Transform
syms n z

Xa = 1 / (1 - 0.7*z^(-1));
xa = iztrans(Xa, z, n);
disp('Inverse Z of Xa:'); pretty(xa);

Xb = (1 - 0.5*z^(-1)) / (1 - 0.8*z^(-1));
xb = iztrans(Xb, z, n);
disp('Inverse Z of Xb:'); pretty(xb);

% Inspection:
% Xa has a pole at z = 0.7 → ROC: |z| > 0.7 → right-sided exponential.
% Xb is a rational function → partial fraction expansion shows exponential decay.

%% Task A5 – H(z), Poles/Zeros & Frequency Response
b = [1 -2.4 2.88];
a = [1 -0.8 0.64];

% (a) Pole-Zero Plot
figure; zplane(b,a); grid on; title('Pole-Zero Plot');

% (b) Frequency Response
[H,w] = freqz(b,a,512);
figure;
subplot(2,1,1); plot(w/pi, abs(H)); grid on; ylabel('|H|'); title('Magnitude Response');
subplot(2,1,2); plot(w/pi, angle(H)); grid on; xlabel('\omega/\pi'); ylabel('Phase');

% (c) Filter Type Explanation:
% The magnitude plot shows attenuation at high frequencies and passband at low frequencies.
% Poles are inside the unit circle, indicating stability.
% Zeros near z = 1 suppress high-frequency components.
% Therefore, this is a low-pass filter.

% Optional test signal
n = 0:511;
x = sin(0.2*pi*n) + 0.5*sin(0.8*pi*n);
y = filter(b,a,x);
