# Computational Modeling of Controlled Ethinylestradiol Release in Different Matrices

## Project Overview

This project, developed as a Final Undergraduate Thesis in Chemical Engineering at Unicamp, consists of a Python-based computational model to simulate and analyze the controlled release of the drug ethinylestradiol from three different matrices: the transdermal patch, the vaginal ring, and the combined oral contraceptive (COC).

### Motivation

This project was motivated by the historical gap in scientific research, which for centuries has excluded or neglected the specificities of women's health. This work seeks to apply engineering tools — specifically computational modeling — to deepen the understanding of contraceptive methods, contributing to fill this gap and promote discussion about better health outcomes for women.

## Technical Solution

The complexity of the problem required the application of different mathematical models and numerical methods to simulate the diffusion phenomena.

* **Mathematical Modeling:**
    * **Transdermal Patch & Vaginal Ring:** The drug diffusion was modeled using Fick's Second Law, resulting in a Partial Differential Equation (PDE).
    * **Oral Contraceptive:** The dissolution was described by the Noyes-Whitney equation, a first-order kinetics model represented by an Ordinary Differential Equation (ODE).

* **Computational Implementation:**
    * **Language:** Python
    * **Libraries:** NumPy, SciPy, Matplotlib, Pandas
    * **Numerical Methods:**
        * For the PDEs, the **Crank-Nicolson method** was implemented—an implicit and unconditionally stable approach chosen to overcome the computational limitations of the standard finite difference method.
        * For the ODE, the **4th-order Runge-Kutta (RK4) method** was used to ensure high precision in the simulation.
## Results

The models generated release profiles consistent with experimental data from the literature, highlighting the different characteristics of each system. The graph below compares the simulated release rate over 21 days.

<img width="1023" height="525" alt="liberacao_combinada" src="https://github.com/user-attachments/assets/335ab841-e286-46a6-99cf-f609c94d364d" style="padding-top: 20px;" />
