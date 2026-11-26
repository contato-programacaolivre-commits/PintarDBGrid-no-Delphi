object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Programa'#231#227'o Livre - Pintar DBGrid Delphi (5 Blocos Prontos)'
  ClientHeight = 460
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 756
    object rgModoPintura: TRadioGroup
      Left = 12
      Top = 8
      Width = 736
      Height = 73
      Caption = ' Selecione o Modo de Pintura (OnDrawColumnCell) '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '1. Efeito Zebrado (Linhas Alternadas)'
        '2. Destacar Linha por Status (ATRASADO)'
        '3. Pintar Apenas C'#233'lula Espec'#237'fica'
        '4. Destacar Linha Selecionada (Foco)'
        '5. Coluna com Texto Negrito/Colorido')
      TabOrder = 0
      OnClick = rgModoPinturaClick
    end
  end
  object dbgDados: TDBGrid
    Left = 12
    Top = 95
    Width = 736
    Height = 322
    DataSource = dsDados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDadosDrawColumnCell
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 423
    Width = 760
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 422
    ExplicitWidth = 756
    object lblDica: TLabel
      Left = 12
      Top = 10
      Width = 505
      Height = 15
      Caption = 
        'Dica: Navegue pelas linhas com as setas do teclado para testar o' +
        ' foco e a sele'#231#227'o em tempo real.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsItalic]
      ParentFont = False
    end
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 160
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 688
    Top = 160
  end
end
