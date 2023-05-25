unit uFutebol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, ComCtrls, StdCtrls;

type
  TfrmJogo = class(TForm)
    PageControl1: TPageControl;
    tbsJogo: TTabSheet;
    shpCampo: TShape;
    shpCentro: TShape;
    shpMeioCampo: TShape;
    shpGolTime2: TShape;
    shpGolTime1: TShape;
    spdTime1_2: TSpeedButton;
    spdTime2_3: TSpeedButton;
    spdTime2_1: TSpeedButton;
    spdTime2_2: TSpeedButton;
    spdTime1_3: TSpeedButton;
    lblTime1: TLabel;
    lblTime2: TLabel;
    tbsResultado: TTabSheet;
    lblResult1: TLabel;
    lblResult2: TLabel;
    edtGols1: TEdit;
    edtGols2: TEdit;
    Label1: TLabel;
    grbMelhorTime1: TGroupBox;
    lblMelhorTime1: TLabel;
    grbMelhorTime2: TGroupBox;
    lblMelhorTime2: TLabel;
    grbPiorTime1: TGroupBox;
    lblPiorTime1: TLabel;
    grbPiorTime2: TGroupBox;
    lblPiorTime2: TLabel;
    grbTime1: TGroupBox;
    cmbTime1: TComboBox;
    grbTime2: TGroupBox;
    cmbTime2: TComboBox;
    spdIniciarPartida: TSpeedButton;
    spbNovaPartida: TSpeedButton;
    spdFimPartida: TSpeedButton;
    spdTime1_1: TSpeedButton;
    spdTime1_4: TSpeedButton;
    spdTime1_5: TSpeedButton;
    spdTime2_5: TSpeedButton;
    spdTime2_4: TSpeedButton;
    rdgTipo_Time1: TRadioGroup;
    rdgTipo_Time2: TRadioGroup;
    grbGols1: TGroupBox;
    lblNormal_Time1: TLabel;
    edtNormal_Time1: TEdit;
    edtFalta_Time1: TEdit;
    lblFalta_Time1: TLabel;
    edtEscanteio_Time1: TEdit;
    lblEscanteio_Time1: TLabel;
    edtPenalti_Time1: TEdit;
    lblPenalti_Time1: TLabel;
    grbGols2: TGroupBox;
    lblNormal_Time2: TLabel;
    lblFalta_Time2: TLabel;
    lblEscanteio_Time2: TLabel;
    lblPenalti_Time2: TLabel;
    edtNormal_Time2: TEdit;
    edtFalta_Time2: TEdit;
    edtEscanteio_Time2: TEdit;
    edtPenalti_Time2: TEdit;
    procedure cmbTime1Change(Sender: TObject);
    procedure cmbTime2Click(Sender: TObject);
    procedure spdIniciarPartidaClick(Sender: TObject);
    procedure GolTime1(Sender: TOBject);
    procedure GolTime2(Sender: TOBject);
    procedure spdFimPartidaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmJogo: TfrmJogo;
  Gols1, Gols2: Array[1..5] of integer;
  Tipo1, Tipo2: Array[0..3] of integer;


implementation

{$R *.DFM}

procedure TfrmJogo.cmbTime1Change(Sender: TObject);
begin
  if (cmbTime1.ItemIndex <> -1) And
     (cmbTime2.ItemIndex <> -1) And
     (cmbTime1.Itemindex <> cmbTime2.ItemIndex) then
     spdIniciarPartida.Enabled := true
   else
     spdIniciarPartida.Enabled := False;

end;

procedure TfrmJogo.cmbTime2Click(Sender: TObject);
begin
    if (cmbTime1.ItemIndex = cmbTime2.ItemIndex) then
        begin
          MessageDlg('Os times devem ser diferentes!',
                     mtInformation, [MBOk], 0);
          cmbTime2.ItemIndex := -1;
          cmbTime2.SetFocus();
        end;
end;

procedure TfrmJogo.GolTime1(Sender: TOBject);
begin
        Inc(Gols1[(Sender as TSpeedButton).Tag]);
        Inc(Tipo1[rdgTipo_Time1.ItemIndex]);
end;

procedure TfrmJogo.GolTime2(Sender: TOBject);
begin
        Inc(Gols2[(Sender as TSpeedButton).Tag]);
        Inc(Tipo2[rdgTipo_Time2.ItemIndex]);
end;

procedure TfrmJogo.spdFimPartidaClick(Sender: TObject);
var MelhorJogador1, PiorJogador1, MelhorJogador2, PiorJogador2, i: Integer;
begin
 edtGols1.Text := IntTostr(Tipo1[0] + Tipo1[1] + Tipo1[3]);
 edtGols2.Text := IntTostr(Tipo2[0] + Tipo2[1] + Tipo2[3]);

 edtNormal_Time1.Text := IntTostr(Tipo1[0]);
 edtFalta_Time1.Text := IntTostr(Tipo1[1]);
 edtEscanteio_Time1.Text := IntTostr(Tipo1[2]);
 edtPenalti_Time1.Text := IntTostr(Tipo1[3]);

 edtNormal_Time2.Text := IntTostr(Tipo2[0]);
 edtFalta_Time2.Text := IntTostr(Tipo2[1]);
 edtEscanteio_Time2.Text := IntTostr(Tipo2[2]);
 edtPenalti_Time2.Text := IntTostr(Tipo2[3]);

  MelhorJogador1 := 1;
  PiorJogador1 := 1;
  MelhorJogador2 := 1;
  PiorJogador2 := 1;

  for i := 2 to 5 do
  begin
    if Gols1[i] > Gols1[MelhorJogador1] then
      MelhorJogador1 := i;
    if Gols1[i] < Gols1[PiorJogador1] then
      PiorJogador1 := i;

    if Gols2[i] > Gols2[MelhorJogador2] then
      MelhorJogador2 := i;
    if Gols2[i] < Gols2[PiorJogador2] then
      PiorJogador2 := i;

      tbsresultado.Show;
  end;

  lblMelhorTime1.Caption := IntToStr(MelhorJogador1);
  lblPiorTime1.Caption := IntToStr(PiorJogador1);
  lblMelhorTime2.Caption := IntToStr(MelhorJogador2);
  lblPiorTime2.Caption := IntToStr(PiorJogador2);

end;

procedure TfrmJogo.spdIniciarPartidaClick(Sender: TObject);
var Contador: integer;
begin
   for Contador := 1 to 5 do
     begin

        Gols1[Contador] := 0;
        Gols2[Contador] := 0;

     end;

   for Contador := 0 to 3 do
     begin
       Tipo1[Contador] := 0;
       Tipo2[Contador] := 0;
     end;


   for Contador := 0 to ComponentCount -1  do
     begin
       if  Components[Contador]  is TSpeedButton then
           TSpeedButton(Components[Contador] ).Enabled := True;
       if Components[Contador] is TRadioGroup then
           TRadioGroup(Components[Contador]).Enabled := True;
     end;

   spdIniciarPartida.Enabled := False;



end;

end.
