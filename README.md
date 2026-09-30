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
![Traffic Light Controller Schematic](path_to_image_or_link_if_embedded)

## Verification & Waveform Analysis
Functional verification was executed to validate timing sequences and state persistence across extensive clock cycles.

* **Simulation Tool:** ModelSim / EDA Playground
* **Key Observations:** Verified that timer thresholds (configured via comparative logic) trigger correct state alterations without overlap or race conditions.
* **Simulation Waveform:**
![Traffic Light Controller Waveform](path_to_image_or_link_if_embedded)

## Repository Structure
```text
├── design.sv       # FSM Controller RTL design code
├── testbench.sv    # Verification testbench and clock/reset generators
└── README.md
