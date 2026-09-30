# Traffic-Light-Controller
``markdown
# Finite State Machine (FSM) Traffic Light Controller

## Overview
An RTL implementation of an automated, sequential Traffic Light Controller designed using a Finite State Machine (FSM) model in Verilog. The controller coordinates multi-phase traffic signals (`Red`, `Yellow`, `Green`) relying on an internal clock divider and counter-based state delay logic.

## FSM State Transitions & Logic
* **States:** Cycles sequentially through primary signal transitions (e.g., Green $\rightarrow$ Yellow $\rightarrow$ Red) governed by a 32-bit counter (`count`).
* **Outputs:** Drives explicit signal lines (`red`, `green`, `yellow`) based on current state variables (`state[1:0]`) and next-state combinatorial logic (`next_state[1:0]`).
* **Asynchronous Reset:** Initializes the controller safely to the default baseline state upon startup.

### RTL Schematic Diagram
*(Synthesized structural schematic showing state registers, multiplexers, and comparators)*  
<img width="987" height="824" alt="Screenshot 2026-09-27 123644" src="https://github.com/user-attachments/assets/aefebf24-fb81-480d-823b-9f0d245ec7c3" />

## Verification & Waveform Analysis
Functional verification was executed to validate timing sequences and state persistence across extensive clock cycles.

* **Simulation Tool:** ModelSim / EDA Playground
* **Key Observations:** Verified that timer thresholds (configured via comparative logic) trigger correct state alterations without overlap or race conditions.
* **Simulation Waveform:**
<img width="1917" height="345" alt="Screenshot 2026-09-30 090411" src="https://github.com/user-attachments/assets/2e2cd65e-a75e-4dfa-87eb-94c5ab435398" />

## Repository Structure
```text
├── design.sv       # FSM Controller RTL design code
├── testbench.sv   # Verification testbench and clock/reset generators
├── run.sh
└── README.md
