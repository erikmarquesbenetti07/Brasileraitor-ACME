program pFutebol;

uses
  Vcl.Forms,
  uFutebol in 'uFutebol.pas' {frmJogo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmJogo, frmJogo);
  Application.Run;
end.
