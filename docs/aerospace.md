# Aerospace Tiling Window Manager Cheatsheet

Aerospace is a tiling window manager for macOS. 
**Note:** This configuration uses a custom spatial mnemonic system **HBDG** for directional navigation: `h` (Haut/Up), `b` (Bas/Down), with `d` (Left) and `g` (Right) mapped according to their physical position on the keyboard.

---

## Quick Navigation
- [Workspace Management](#workspace-management)
- [Window Management (HBDG)](#window-management-hbdg)
- [Layouts & Utilities](#layouts--utilities)
- [Service Mode](#service-mode)
- [Automatic Application Routing](#automatic-application-routing)
- [Common Workflows & Examples](#common-workflows--examples)
  - [1. Flipping Layout Orientations](#1-flipping-layout-orientations-horizontal--vertical)
  - [2. Screen Space with Accordion Mode](#2-managing-screen-space-with-accordion-mode)
  - [3. Dispatching Windows & Multi-Monitor](#3-dispatching-windows--multi-monitor-transfers)
  - [4. Fullscreen & Floating Modes](#4-focused-deep-dive-fullscreen--floating)
  - [5. Compound Splits & 2x2 Grids: `A(BC)` and `(AB)(CD)`](#5-compound-splits--2x2-grids-abc-and-abcd)
  - [6. Resetting / Merging Layouts & Vertical Stacking](#6-resetting--merging-layouts--vertical-stacking)

---

### Workspace Management

| Shortcut | Description |
|---|---|
| `Cmd + <1-6, 9>` | Switch to workspaces (1_Browse, 2_Develop, 3_Execute, 4_Read, 5_Communicate, 6_Relax, 9_Experiment). |
| `Cmd + Alt + <1-6, 9>` | Move the focused window to the specified workspace. |
| `Cmd + Alt + Shift + d/g` | Move current workspace to the previous (d) or next (g) monitor. |

### Window Management (HBDG)

| Shortcut | Description |
|---|---|
| `Cmd + h/b/d/g` | Focus window Up (h), Down (b), Left (d), or Right (g). |
| `Cmd + Shift + h/b/d/g` | Move the focused window Up (h), Down (b), Left (d), or Right (g). |

### Layouts & Utilities

| Shortcut | Description |
|---|---|
| `Alt + f` | Toggle floating/tiling mode for the focused window. |
| `Alt + Shift + f` | Toggle fullscreen. |
| `Alt + t` | Switch to Tiles layout. |
| `Alt + a` | Switch to Accordion layout. |
| `Alt + h` | Split layout horizontally. |
| `Alt + v` | Split layout vertically. |
| `Alt + Shift + h/b/d/g` | Join focused window with adjacent window Up (h), Down (b), Left (d), or Right (g). |
| `Alt + Enter` | Open Finder. |

### Service Mode

Enter Service Mode by pressing `Alt + Shift + c`. Once in Service Mode, use the following keys:

| Shortcut | Description |
|---|---|
| `Esc` | Reload config and return to main mode. |
| `r` | Reset layout (flatten workspace tree into one group) and return to main mode. |
| `d` | Toggle Aerospace enable/disable and return to main mode. |
| `Backspace` | Close all windows but the current one and return to main mode. |

### Automatic Application Routing

- **1_Browse**: Brave, Chrome
- **2_Develop**: VSCode, Xcode, Simulator
- **3_Execute**: Terminal
- **4_Read**: Acrobat, Notes, iBooks
- **5_Communicate**: Mail, Outlook, FaceTime, Messages, Discord, Teams, Zoom
- **6_Relax**: Spotify, Apple Music
- **Floating**: Finder, System Preferences

### Common Workflows & Examples

#### 1. Flipping Layout Orientations (Horizontal / Vertical)
- **Scenario**: You have two windows side-by-side (`VSCode | Terminal`) and want them stacked vertically.
- **Workflow**:
  1. Press `Alt + v` to switch the layout to a vertical split (`VSCode` over `Terminal`).
  2. Press `Alt + h` to switch back to a horizontal side-by-side split.

#### 2. Managing Screen Space with Accordion Mode
- **Scenario**: You have 3+ windows open in `4_Read` or `2_Develop` and need maximum reading space without losing context.
- **Workflow**:
  1. Press `Alt + a` to switch into **Accordion layout** (inactive windows collapse into narrow strips).
  2. Navigate between windows using `Cmd + d` (left) or `Cmd + g` (right).
  3. Press `Alt + t` when done to return to standard tiled layout.

#### 3. Dispatching Windows & Multi-Monitor Transfers
- **Scenario**: An application was opened in `2_Develop` that belongs in `3_Execute`, and you want it on your secondary screen.
- **Workflow**:
  1. Focus the window and press `Cmd + Alt + 3` to send it to workspace `3_Execute`.
  2. Press `Cmd + 3` to switch to `3_Execute`.
  3. Press `Cmd + Alt + Shift + g` (next monitor) or `Cmd + Alt + Shift + d` (previous monitor) to move the workspace to the desired physical display.

#### 4. Focused Deep Dive (Fullscreen & Floating)
- **Scenario**: You need to temporarily focus on logs or a large diff, or un-tile a dialog window.
- **Workflow**:
  1. Press `Alt + Shift + f` to expand the focused window to fullscreen.
  2. Press `Alt + Shift + f` again to snap back into the tiling arrangement.
  3. If a window is better suited as a floating dialog, press `Alt + f` to toggle between floating and tiling modes.

#### 5. Compound Splits & 2x2 Grids: `A(BC)` and `(AB)(CD)`

##### Case A: Creating `A(BC)` (1 Primary Window + 2 Stacked Auxiliary Windows)
- **Scenario**: You have 3 windows open side-by-side (`Browser | VSCode | Terminal`). You want `Browser` (A) taking the full left half, and `VSCode` (B) & `Terminal` (C) stacked vertically on the right half.

**Initial Layout:**
```text
+-------------------+-------------------+-------------------+
|     Browser (A)   |     VSCode (B)    |    Terminal (C)   |
+-------------------+-------------------+-------------------+
```

- **Workflow via Keyboard Shortcuts:**
  1. Focus **VSCode (B)** using `Cmd + g` (from Browser) or `Cmd + d` (from Terminal).
  2. Press **`Alt + Shift + g`** (`join-with right`).
  3. VSCode (B) and Terminal (C) are immediately grouped into a nested vertical stack `(BC)`.

**Target Layout `A(BC)`:**
```text
+-------------------+-------------------+
|                   |     VSCode (B)    |
|    Browser (A)    +-------------------+
|                   |    Terminal (C)   |
+-------------------+-------------------+
```

- **Workflow via CLI (Terminal):**
  - While focused on VSCode: `aerospace join-with right`
  - Or while focused on Terminal: `aerospace join-with left`

- **Adjusting the sub-container:**
  - Focus VSCode or Terminal and press `Alt + h`: changes the `(BC)` pair to horizontal split `(B | C)`.
  - Press `Alt + v`: switches `(BC)` back to vertical stack.

---

##### Case B: Creating `(AB)(CD)` (4-Pane 2x2 Grid)
- **Scenario**: You have 4 windows `[ A | B | C | D ]` side-by-side and want a balanced 2x2 grid.

- **Workflow:**
  1. Focus window **A**, press **`Alt + Shift + g`** (`join-with right`) -> fuses A & B into a vertical column `(AB)`.
  2. Focus window **C**, press **`Alt + Shift + g`** (`join-with right`) -> fuses C & D into a vertical column `(CD)`.

**Target Layout `(AB)(CD)`:**
```text
+-------------------+-------------------+
|         A         |         C         |
+-------------------+-------------------+
|         B         |         D         |
+-------------------+-------------------+
```

#### 6. Resetting / Merging Layouts & Vertical Stacking
- **Scenario**: You have a compound layout like `A(BC)` or `(AB)(CD)` and want to overwrite/reset it by merging all windows into a single group and stacking everything vertically.
- **Workflow**:
  1. **Merge all windows into one flat group (Flatten)**:
     - Press **`Alt + Shift + c`** (Service Mode), then press **`r`** *(runs `flatten-workspace-tree`)*.
     - *(Or via CLI in terminal: `aerospace flatten-workspace-tree`)*.
     - All sub-containers are dissolved, restoring all windows as flat siblings: `[ A | B | C ]`.
  2. **Stack all windows vertically**:
     - Press **`Alt + v`** *(runs `layout vertical`)*.
     - Since all windows now belong to the same root group, every window immediately stacks vertically:
       ```text
       +-----------------------------------+
       |                 A                 |
       +-----------------------------------+
       |                 B                 |
       +-----------------------------------+
       |                 C                 |
       +-----------------------------------+
       ```
  3. *(Optional)* Press **`Alt + h`** anytime to flip the entire merged group back to a flat horizontal side-by-side layout (`[ A | B | C ]`).
