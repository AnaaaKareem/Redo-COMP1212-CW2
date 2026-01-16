# Hack Assembly Programming (CWK2)

The **Hack Assembly Programming** project is a fundamental exercise in low-level programming using the **Hack Assembly Language**. It involves implementing efficient assembly algorithms to perform bitwise operations and encryption logic directly on the Hack platform's RAM and CPU.

The project proceeds from basic logical operations to more complex arithmetic manipulations, culminating in a full encryption algorithm implementation.

---

## Input and Interaction

The programs are simulated using the **Nand2Tetris CPU Emulator**. Interaction is primarily through automated test scripts which initialize RAM values and verify the resulting memory state.

* **Inputs**:
  * **XOR**: Operands in `RAM[3]` and `RAM[4]`.
  * **Rotate**: Input value in `RAM[3]`, shift amount in `RAM[4]`.
  * **Feistel Encryption**: Data and Key components in `RAM[1]` and `RAM[2]`.
* **Outputs**:
  * **XOR**: Result stored in `RAM[5]`.
  * **Rotate**: Result stored in `RAM[5]`.
  * **Feistel Encryption**: Encrypted result stored in `RAM[0]`.

**Interaction Flow:**

1. Load the Program (`.asm`) into the CPU Emulator.
2. Load the corresponding Test Script (`.tst`).
3. Run the simulation.
4. The script sets RAM values, executes the code, and compares the final RAM state to expected values.

---

## Output Format

The simulation generates output files and compares them against expected results:

* **Output Files**:
  * `.out`: The actual RAM values recorded during simulation.
  * `.cmp`: The expected RAM values (Compare file).
  * **Success**: The simulator displays "Comparison ended successfully" if functionality is correct.

---

## How to Run

### Requirements

Allowed execution environment: **Nand2Tetris Software Suite** (specifically the `CPUEmulator`).

### Execution

1. Launch the **CPUEmulator** script/bat from the Nand2Tetris tools.
2. **Load Program**: Click the folder icon to load an ASM file (e.g., `ASMFiles/XOR/0/XOR.asm`).
3. **Load Script**: Click the script icon to select the matching test (e.g., `testFiles/XOR.tst`).
4. **Run**:
    * Press the **Run** button (Double Blue Arrows or Play icon) to execute the script.
    * Watch the "Output" and "Compare" views populate.
5. **Verify**:
    * Ensure the status bar reads "Comparison ended successfully".

---

## Program Features

* **Bitwise Operations (XOR)**:
  * Implements Exclusive-OR logic using the limited Hack instruction set (which natively supports only AND, OR, NOT).
  * Optimized for minimum instruction count.
* **Arithmetic Manipulation (Rotate)**:
  * Performs bitwise rotation operations on inputs.
  * Handles shifting of bits with wrap-around at the word boundary.
* **Encryption Algorithm (Feistel)**:
  * Implements a Feistel Cipher structure.
  * Uses a feedback loop where data is split and processed in rounds depending on the key.
* **Allowed Instructions**:
  * Standard Hack A-instructions (addressing) and C-instructions (computation).

---

## Author and License

It is not licensed and is free to use and modify for educational purposes.

---

## Assembly Design Process

The following traces the theoretical process used to create the programs in this project.

### 1. Algorithm Design

We begin with the high-level logic or pseudocode for the operation.

* **XOR Logic**: $A \oplus B = (A \cdot \overline{B}) + (\overline{A} \cdot B)$
* **Rotation**: Identifying bit-masking and shifting requirements.

### 2. Register Allocation

We map variables to specific RAM addresses or CPU registers (D, A, M).

* `RAM[3]` -> Load into D register
* `RAM[4]` -> Operate with D

### 3. Implementation

The logic is translated into Hack Assembly syntax.

```asm
// Example partial implementation
@3
D=M         // Load RAM[3] into D
@4
D=D&M       // AND D with RAM[4]
@5
M=D         // Store result in RAM[5]
```
