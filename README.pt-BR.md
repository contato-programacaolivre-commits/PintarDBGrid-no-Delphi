🌐 **Idioma / Language:** [Português (Brasil)](README.pt-BR.md) | [English](README.md)

# Como Pintar DBGrid no Delphi — 5 Blocos Prontos (`OnDrawColumnCell`)

Projeto prático em VCL demonstrando como personalizar cores de linhas, efeito zebrado, barra de seleção ativa e destaque condicional por status no `TDBGrid` do Delphi sem piscar a tela (*flicker*) e sem quebrar o alinhamento padrão dos textos.

📖 **Artigo Completo no Blog:** [Como Pintar DBGrid Delphi: 5 Blocos Prontos (OnDrawColumnCell)](https://programacaolivre.com.br) *(atualizar com o slug completo do Artigo #1)*

---

## 🎯 O Que Este Projeto Demonstra

1. **Efeito Zebrado (Linhas Alternadas):** Alternância limpa de cores de fundo utilizando `DataSource.DataSet.RecNo` para facilitar a leitura de tabelas extensas.
2. **Destaque Condicional da Linha Inteira:** Pintura dinâmica da linha completa com base no valor de um campo (ex: contas vencidas, cadastros inativos ou estoque crítico).
3. **Pintura de Célula Específica (Coluna de Status):** Destaque visual apenas na coluna desejada (como `STATUS`) mantendo o restante da linha neutro.
4. **Personalização da Linha Selecionada (`gdSelected`):** Controle da cor de seleção padrão do Windows para que o texto continue legível mesmo com a linha selecionada.
5. **Renderização Segura (`DefaultDrawColumnCell`):** Uso correto de `Canvas.Brush.Color`, `Canvas.Font.Color` e `DefaultDrawColumnCell` para evitar falhas visuais ao rolar o grid.

## 🛠️ Como Executar na Sua Máquina

1. Clone ou baixe este repositório.
2. Abra o arquivo `.dproj` no **Delphi 10 Seattle** ou **RAD Studio 11+ / Delphi Community Edition**.
3. Pressione **`F9`** para compilar e executar (utiliza dataset em memória — não exige instalação de banco de dados externo).

## ✅ Compatibilidade & Padrão de Código

- Validado no **Delphi 10 Seattle** e **RAD Studio 11+ / Delphi Community Edition** (alvos Windows 32-bit e 64-bit).
- Compilação limpa, sem *hints* ou *warnings* (`W1035`).
- 100% retrocompatível (sem variáveis inline e seguindo rigorosamente o padrão limpo do projeto).

---

*Mantido por **Programação Livre** — Engenharia de Software Prática e Código Limpo.*
