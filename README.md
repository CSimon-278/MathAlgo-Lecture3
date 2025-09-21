## Task A1 – Finite Sequences
- X(z) for x[n] = {1,2,5} → `1 + 2z^{-1} + 5z^{-2}`
- X(z) for x[n] = {0,3,0,4} → `3z^{-1} + 4z^{-3}`
- ROC is entire z-plane except possibly z = ∞.

## Task A2 – Infinite Sequences & ROC
- a = 0.6 → ROC: |z| > 0.6
- a = -0.8 → ROC: |z| > 0.8
- Left-sided → ROC: |z| < 0.9
- ROC excludes poles and defines convergence region.

## Task A3 – Linearity & Shifting
- Linear combination: `Z{2x1 - 3x2}` computed symbolically.
- Time-shift: `Z{x1[n−3]}` shows delay by 3 samples.

## Task A4 – Inverse Z-Transform
- Xa → right-sided exponential: `x[n] = 0.7^n u[n]`
- Xb → difference of exponentials: `x[n] = 0.8^n - 0.5*0.8^n`

## Task A5 – Filter Analysis
- Poles: complex conjugates inside unit circle.
- Zeros: near z = 1.
- Filter Type: **Low-pass**.
- Magnitude plot confirms suppression of high frequencies.

## Reflections
- Learned how ROC shapes the behavior of Z-transforms.
- Symbolic tools in MATLAB simplify verification.
- Frequency response plots reveal filter characteristics clearly.
