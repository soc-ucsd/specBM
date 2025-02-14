# SpecBM
Spectral Bundle Method (SBM) - Primal and Dual formulations (SBMP and SBMD).

The algrotithms are described in our paper [An Overview and Comparison of Spectral Bundle Methods for Primal and Dual Semidefinite Programs](https://arxiv.org/pdf/2307.07651.pdf).

Note: parts of the code require the installation of [Sedumi](https://sedumi.ie.lehigh.edu/) and [Mosek](https://www.mosek.com/).

To get a quick start, try the file `TestSBM.m`


To access large-scale data, please visit [Google drive](https://drive.google.com/drive/folders/101KqJ56fwcZMuYuTTpwUASnevcnB2frt?usp=drive_link).

## Table of Content

- [Description](#description)
	- [SBMP](#sbmp)
	- [SBMD](#sbmd)
- [Quick Start](#quick-start)
- [Dependency](#dependency)

# Description

SBMP and SBMD consider the standard primal and dual semidefinite programs

***[Primal]***
```math 
	\min_{X}\quad \langle C,X \rangle, \quad \mathrm{subject~to}\quad \mathcal{A}(X) = b,\; X \in \mathbb{S}^n_+. 
```

***[Dual]***
```math
	\max_{y,Z}\quad b^{\mathsf{T}}y, \quad \mathrm{subject~to}\quad \mathcal{A}^{*}y +Z= C,\; Z \in \mathbb{S}^n_+. 
```
## SBMP

SBMP solves the penalized primal problem 
```math
\min_{X \in \mathcal{X}_0} \quad \langle C,X\rangle + \rho \max \{\lambda_{\max}(-X),0\},
```
where $` \mathcal{X}_0 =\{X \in \mathbb{S}^n_+ \mid \mathcal{A}(X) = b\} `$ is a closed convex set.

The parameter $` \rho `$ should be chosen as $$\rho > \sup_{Z^{\star} \in \mathcal{D}^\star} \mathop{\bf tr}(Z^{\star}),$$ where $` \mathcal{D}^\star = \left\{(y,Z) \in \mathbb{R}^m \times \mathbb{S}^{n} \mid d^\star = b^{\mathsf{T}} y, Z+\mathcal{A}^* (y) = C, Z \in \mathbb{S}^n_+\right\}`$ is the optimal solution set of the dual problem [Dual].


## SBMD
SBMD solves the penalized dual problem 
```math
\min_{y \in \mathbb{R}^m} \quad -b^{\mathsf{T}} y + \rho \max \{\lambda_{\max}(\mathcal{A}^{*}y-C),0\}.
```
The parameter $` \rho `$ should be chosen as $$\rho > \sup_{X^{\star} \in \mathcal{P}^\star} \mathop{\bf tr}(X^{\star}),$$
where $` \mathcal{P}^\star= \left\{X \in \mathbb{S}^{n} \mid p^\star = \langle C, X\rangle, \mathcal{A}(X) = b, X \in \mathbb{S}^n_+\right\}`$ is the optimal solution set of the primal problem [Primal].

# Quick Start
To run SBMP or SBMD, use the commands

	opts.Maxiter     = 200;                %Maximun number of iteration
	opts.rho         = your choice of penalty parameter; 
	opts.MaxCols     = 2;                  %Total number of eivenvectors (This should be opts.MaxCols = opts.EvecPast + opts.EvecCurrent)
	opts.EvecPast    = 1;	               %Number of past eigenvectors
	opts.EvecCurrent = 1;                  %Number of current eigenvectors
	opts.solver      = "primal";           %Primal or Dual Spectral Bundle Method
	Out_Primal_1_1   = SBM(At,b,c,K,opts); %Run

The parameter `opts.rho` should be chosen correctly as discussed in [SBMP](#sbmp) and [SBMD](#sbmd)!

Try `TestSBM.m` to get a better understanding.

# Dependency
The code requires the installation of [Sedumi](https://sedumi.ie.lehigh.edu/) and [Mosek](https://www.mosek.com/).

# Contact us
To contact us about SBM, suggest improvements, and report bugs, please email either [Feng-Yi Liao](mailto:fliao@ucsd.edu?Subject=SBM) or [Yang Zheng](mailto:zhengy@eng.ucsd.edu?Subject=SBM).
