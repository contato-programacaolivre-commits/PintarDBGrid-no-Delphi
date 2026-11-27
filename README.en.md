🌐 **Language / Idioma:** [Português (Brasil)](README.md) | [English](README.en.md)

# Customizing TDBGrid in Delphi — 5 Ready-to-Use Blocks (`OnDrawColumnCell`)

Practical VCL demonstration project showing how to customize row colors, alternating zebra stripes, active selection bars, and conditional status styling in Delphi's `TDBGrid` without flickering or breaking default text alignment.

📖 **Full Technical Guide (Portuguese):** [Como Pintar DBGrid Delphi: 5 Blocos Prontos (OnDrawColumnCell)](https://programacaolivre.com.br/como-pintar-dbgrid-delphi-ondrawcolumncell/) 

---

## 🎯 What This Project Covers

1. **Zebra Striping (Alternating Row Colors):** Clean alternating background colors using `DataSource.DataSet.RecNo` without hurting readability.
2. **Conditional Row Highlighting:** Painting entire rows based on field values (e.g., overdue invoices, inactive records, or low stock alerts).
3. **Single Cell / Status Column Styling:** Highlighting specific columns (such as a `STATUS` badge) while keeping the rest of the row clean.
4. **Custom Selected Row (`gdSelected`):** Overriding Delphi's default dark-blue selection highlight so conditional colors remain legible when the user clicks a row.
5. **Safe Default Rendering (`DefaultDrawColumnCell`):** Proper usage of `Canvas.Brush.Color`, `Canvas.Font.Color`, and `DefaultDrawColumnCell` to prevent visual artifacts.

## 🛠️ How to Run

1. Clone or download this repository.
2. Open the `.dproj` file in **Delphi 10 Seattle** or **RAD Studio 11+ / Delphi Community Edition**.
3. Press **`F9`** to compile and run (uses in-memory `TClientDataSet` / `TFDMemTable` — no external database server required).

## ✅ Compatibility & Code Standards

- Tested on **Delphi 10 Seattle** and **RAD Studio 11+ / Delphi Community Edition** (32-bit and 64-bit Windows targets).
- Zero compiler hints or warnings (`W1035` clean).
- Strictly compatible with classic Object Pascal syntax (no inline variables, explicit `:= nil` / `FreeAndNil` memory management).

---

*Maintained by **Programação Livre** — Practical Software Engineering & Clean Code.*
