unit Main;

interface //#################################################################### ��

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  OpenCL.cl_platform, OpenCL.cl,
  LUX.Code.C, LUX.GPGPU.OpenCL;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { private �錾 }
  public
    { public �錾 }
  end;

var
  Form1: TForm1;

implementation //############################################################### ��

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
var
   Ps :TArray<TCLPlatform>;
   P  :TCLPlatform;
   E  :String;
   D  :TCLDevice;
begin
     if GetPlatforms( Ps, CL_DEVICE_TYPE_ALL ) <> CL_SUCCESS then Exit;

     for P in Ps do
     begin
          with P do
          begin
               Memo1.Lines.Add( '�� PLATFORM: ' + Cardinal( ID ).ToString );
               Memo1.Lines.Add( '�ENAME      :' + Name                    );
               Memo1.Lines.Add( '�EVENDOR    :' + Vendor                  );
               Memo1.Lines.Add( '�EVERSION   :' + Version                 );
               Memo1.Lines.Add( '�EPROFILE   :' + Profile                 );
               Memo1.Lines.Add( '�EEXTENSIONS:'                           );
               for E in Extensions do
               Memo1.Lines.Add( '�@- '          + E                       );

               for D in Devices do
               begin
                    with D do
                    begin
                         Memo1.Lines.Add( '�� DEVICE: ' + Cardinal( ID ).ToString );
                         Memo1.Lines.Add( '�ENAME      :' + Name                  );
                         Memo1.Lines.Add( '�EVENDOR    :' + Vendor                );
                         Memo1.Lines.Add( '�EVERSION   :' + Version               );
                         Memo1.Lines.Add( '�EPROFILE   :' + Profile               );
                         Memo1.Lines.Add( '�EDRIVER    :' + Driver                );
                         Memo1.Lines.Add( '�EEXTENSIONS:'                         );
                         for E in Extensions do
                         Memo1.Lines.Add( '�@- '          + E                     );
                    end;
               end;
          end;

          Memo1.Lines.Add( '' );
     end;
end;

end. //######################################################################### ��
