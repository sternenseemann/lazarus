unit helpinfo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, proginfo,
  lcltranslator, Buttons, lclintf, ExtCtrls;

type

  { TFormHelpInfo }

  TFormHelpInfo = class(TForm)
    ButtonClose: TButton;
    CheckBoxExpertMode: TCheckBox;
    ImageLogo: TImage;
    LabelCopy: TLabel;
    LabelCopyRight: TLabel;
    LabelCredits: TLabel;
    LabelCreditsTo: TLabel;
    LabelLang: TLabel;
    LabelLanguage: TLabel;
    LabelName: TLabel;
    LabelOpsiWeb: TLabel;
    LabelUibWeb: TLabel;
    LabelVers: TLabel;
    LabelVersion: TLabel;
    PanelDescriptions: TPanel;
    PanelInfo: TPanel;
    PanelInfoContent: TPanel;
    PanelTop: TPanel;
    PanelCredits: TPanel;
    PanelBottom: TPanel;
    PanelVersion: TPanel;
    SpeedButtonManual: TSpeedButton;
    procedure ButtonCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabelOpsiWebClick(Sender: TObject);
    procedure LabelOpsiWebMouseEnter(Sender: TObject);
    procedure LabelOpsiWebMouseLeave(Sender: TObject);
    procedure LabelUibWebClick(Sender: TObject);
    procedure LabelUibWebMouseEnter(Sender: TObject);
    procedure LabelUibWebMouseLeave(Sender: TObject);
    procedure SpeedButtonManualClick(Sender: TObject);
  private
    procedure MouseEnterLink(Sender: TObject);
    procedure MouseLeaveLink(Sender: TObject);

  public

  end;

var
  FormHelpInfo: TFormHelpInfo;

//resourcestring
  //rsExpertMode = 'Expert mode';



implementation

{$R *.lfm}

{ TFormHelpInfo }

procedure TFormHelpInfo.FormCreate(Sender: TObject);
begin
   //SpeedButtonExpertMode.Caption := rsExpertMode;
  LabelVersion.Caption := ProgramInfo.Version;
  LabelLanguage.Caption := GetDefaultLang;
  LabelCopyRight.Caption:= 'uib gmbh under AGPLv3';
  LabelUibWeb.Caption := 'http://uib.de';
  LabelOpsiWeb.Caption:= 'https://opsi.org';
  LabelCredits.Caption:= 'Lazarus/FPC, synapse, sqllite';
end;

procedure TFormHelpInfo.LabelOpsiWebClick(Sender: TObject);
begin
  OpenUrl('https://opsi.org');
end;

procedure TFormHelpInfo.LabelOpsiWebMouseEnter(Sender: TObject);
begin
  MouseEnterLink(Sender);
end;

procedure TFormHelpInfo.LabelOpsiWebMouseLeave(Sender: TObject);
begin
  MouseLeaveLink(Sender);
end;

procedure TFormHelpInfo.LabelUibWebClick(Sender: TObject);
begin
  OpenUrl('https://uib.de');
end;

procedure TFormHelpInfo.LabelUibWebMouseEnter(Sender: TObject);
begin
  MouseEnterLink(Sender);
end;

procedure TFormHelpInfo.LabelUibWebMouseLeave(Sender: TObject);
begin
  MouseLeaveLink(Sender);
end;

procedure TFormHelpInfo.SpeedButtonManualClick(Sender: TObject);
var
  languageNotFound:boolean;
begin
   if GetDefaultLang = 'de' then
     OpenUrl('https://download.uib.de/opsi4.1/documentation/html/'+
       'opsi-manual-v4.1/opsi-manual-v4.1.html#software-on-demand')
   else OpenUrl('https://download.uib.de/opsi4.1/documentation/html/en/' +
     'opsi-manual-v4.1/opsi-manual-v4.1.html#software-on-demand');
end;

procedure TFormHelpInfo.MouseEnterLink(Sender: TObject);
begin
  Screen.Cursor := crHandPoint;
  (Sender as TControl).Font.Style := [fsUnderline];
end;

procedure TFormHelpInfo.MouseLeaveLink(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  (Sender as TControl).Font.Style := [];
end;


procedure TFormHelpInfo.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.

