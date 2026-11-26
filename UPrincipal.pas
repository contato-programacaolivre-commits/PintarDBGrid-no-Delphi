unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlTopo: TPanel;
    rgModoPintura: TRadioGroup;
    dbgDados: TDBGrid;
    pnlRodape: TPanel;
    lblDica: TLabel;
    cdsDados: TClientDataSet;
    dsDados: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgModoPinturaClick(Sender: TObject);
  private
    procedure CriarDadosExemplo;
    procedure AdicionarRegistro(ACodigo: Integer; const ACliente: string;
      AValor: Currency; const AStatus: string);
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  CriarDadosExemplo;
end;

procedure TfrmPrincipal.CriarDadosExemplo;
begin
  cdsDados.Close;
  cdsDados.FieldDefs.Clear;
  cdsDados.FieldDefs.Add('CODIGO', ftInteger);
  cdsDados.FieldDefs.Add('CLIENTE', ftString, 40);
  cdsDados.FieldDefs.Add('VALOR', ftCurrency);
  cdsDados.FieldDefs.Add('STATUS', ftString, 15);
  cdsDados.CreateDataSet;

  // Desabilita controles visuais durante a carga em lote para ganhar performance
  cdsDados.DisableControls;
  try
    AdicionarRegistro(101, 'Comercial Alfa Ltda', 1250.00, 'PAGO');
    AdicionarRegistro(102, 'Distribuidora Beta S/A', 3480.50, 'ATRASADO');
    AdicionarRegistro(103, 'Metalúrgica Gama', 890.00, 'PENDENTE');
    AdicionarRegistro(104, 'Supermercado Delta', 5120.90, 'ATRASADO');
    AdicionarRegistro(105, 'Transportadora Épsilon', 430.00, 'PAGO');
    AdicionarRegistro(106, 'Indústria Zeta Brasil', 2740.00, 'PENDENTE');
    AdicionarRegistro(107, 'Oficina Ômega Ltda', 615.80, 'PAGO');
    cdsDados.First;
  finally
    cdsDados.EnableControls;
  end;

  // Ajusta largura das colunas para visualização limpa
  if dbgDados.Columns.Count >= 4 then
  begin
    dbgDados.Columns[0].Title.Caption := 'Código';
    dbgDados.Columns[0].Width := 70;
    dbgDados.Columns[1].Title.Caption := 'Cliente';
    dbgDados.Columns[1].Width := 310;
    dbgDados.Columns[2].Title.Caption := 'Valor (R$)';
    dbgDados.Columns[2].Width := 130;
    dbgDados.Columns[3].Title.Caption := 'Status';
    dbgDados.Columns[3].Width := 150;
  end;
end;

procedure TfrmPrincipal.AdicionarRegistro(ACodigo: Integer;
  const ACliente: string; AValor: Currency; const AStatus: string);
begin
  cdsDados.Append;
  cdsDados.FieldByName('CODIGO').AsInteger := ACodigo;
  cdsDados.FieldByName('CLIENTE').AsString := ACliente;
  cdsDados.FieldByName('VALOR').AsCurrency := AValor;
  cdsDados.FieldByName('STATUS').AsString := AStatus;
  cdsDados.Post;
end;

procedure TfrmPrincipal.rgModoPinturaClick(Sender: TObject);
begin
  // Força o redesenho imediato da grade ao trocar o modo de pintura
  dbgDados.Invalidate;
end;

procedure TfrmPrincipal.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  lGrid: TDBGrid;
  lStatus: string;
begin
  lGrid := TDBGrid(Sender);

  if not Assigned(lGrid.DataSource) or not Assigned(lGrid.DataSource.DataSet) then
    Exit;

  if lGrid.DataSource.DataSet.IsEmpty then
    Exit;

  lStatus := lGrid.DataSource.DataSet.FieldByName('STATUS').AsString;

  case rgModoPintura.ItemIndex of
    0:
      begin
        // BLOCO 1: Efeito Zebrado (Linhas alternadas)
        if not (gdSelected in State) then
        begin
          if Odd(lGrid.DataSource.DataSet.RecNo) then
            lGrid.Canvas.Brush.Color := clWhite
          else
            lGrid.Canvas.Brush.Color := $00F5F7FA; // Cinza azulado suave
          lGrid.Canvas.Font.Color := clWindowText;
        end;
      end;

    1:
      begin
        // BLOCO 2: Pintar a linha inteira conforme valor de um campo (STATUS = ATRASADO)
        if not (gdSelected in State) then
        begin
          if SameText(lStatus, 'ATRASADO') then
          begin
            lGrid.Canvas.Brush.Color := $00E6E6FF; // Vermelho pastel suave (BGR)
            lGrid.Canvas.Font.Color := clMaroon;
            lGrid.Canvas.Font.Style := [fsBold];
          end
          else
          begin
            lGrid.Canvas.Brush.Color := clWhite;
            lGrid.Canvas.Font.Color := clWindowText;
          end;
        end;
      end;

    2:
      begin
        // BLOCO 3: Pintar APENAS uma célula específica sem afetar o resto da linha
        if (not (gdSelected in State)) and SameText(Column.FieldName, 'STATUS') then
        begin
          if SameText(lStatus, 'PAGO') then
          begin
            lGrid.Canvas.Brush.Color := $00E8F8EE; // Verde suave
            lGrid.Canvas.Font.Color := clGreen;
            lGrid.Canvas.Font.Style := [fsBold];
          end
          else if SameText(lStatus, 'ATRASADO') then
          begin
            lGrid.Canvas.Brush.Color := $00E6E6FF; // Vermelho suave
            lGrid.Canvas.Font.Color := clRed;
            lGrid.Canvas.Font.Style := [fsBold];
          end;
        end;
      end;

    3:
      begin
        // BLOCO 4: Personalizar a cor da linha selecionada (Foco ativo)
        if (gdSelected in State) then
        begin
          lGrid.Canvas.Brush.Color := $008A4B08; // Azul escuro corporativo (BGR)
          lGrid.Canvas.Font.Color := clWhite;
          lGrid.Canvas.Font.Style := [fsBold];
        end;
      end;

    4:
      begin
        // BLOCO 5: Destacar fonte de coluna numérica/financeira mantendo fundo padrão
        if (not (gdSelected in State)) and SameText(Column.FieldName, 'VALOR') then
        begin
          lGrid.Canvas.Font.Style := [fsBold];
          if lGrid.DataSource.DataSet.FieldByName('VALOR').AsCurrency >= 2000 then
            lGrid.Canvas.Font.Color := clNavy
          else
            lGrid.Canvas.Font.Color := clWindowText;
        end;
      end;
  end;

  // Obrigatório chamar DefaultDrawColumnCell para o Delphi desenhar o texto e bordas
  lGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.

