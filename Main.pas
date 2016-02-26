unit Main;

interface //#################################################################### Å°

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
    { private êÈåæ }
  public
    { public êÈåæ }
    procedure ShowLine( const T_:String; const A_:TArray<T_char> );
    procedure ShowList( const T_:String; const A_:TArray<T_char> );
  end;

var
  Form1: TForm1;

implementation //############################################################### Å°

{$R *.fmx}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

procedure TForm1.ShowLine( const T_:String; const A_:TArray<T_char> );
begin
     if Assigned( A_ ) then Memo1.Lines.Add( 'ÅE' + T_ + ': ' + P_char( A_ ) );
end;

procedure TForm1.ShowList( const T_:String; const A_:TArray<T_char> );
var
   T, S :String;
begin
     if Assigned( A_ ) then
     begin
          Memo1.Lines.Add( 'ÅE' + T_ + ':' );

          T := P_char( A_ );

          for S in T.Split( [' '] ) do Memo1.Lines.Add( 'Å@- ' + S );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
var
   P :T_cl_platform_id;
   D :T_cl_device_id;
begin
     for P in GetPlatformIDs do
     begin
          Memo1.Lines.Add( 'Å• PLATFORM: ' + Cardinal( P ).ToString );

          ShowLine( 'NAME      ', GetPlatformInfo( P, CL_PLATFORM_NAME       ) );
          ShowLine( 'VENDOR    ', GetPlatformInfo( P, CL_PLATFORM_VENDOR     ) );
          ShowLine( 'VERSION   ', GetPlatformInfo( P, CL_PLATFORM_VERSION    ) );
          ShowLine( 'PROFILE   ', GetPlatformInfo( P, CL_PLATFORM_PROFILE    ) );
          ShowList( 'EXTENSIONS', GetPlatformInfo( P, CL_PLATFORM_EXTENSIONS ) );

          for D in GetDeviceIDs( P, CL_DEVICE_TYPE_ALL ) do
          begin
               Memo1.Lines.Add( 'Å§ DEVICE: ' + Cardinal( D ).ToString );

               ShowLine( 'NAME      ', GetDeviceInfo( D, CL_DEVICE_NAME       ) );
               ShowLine( 'VENDOR    ', GetDeviceInfo( D, CL_DEVICE_VENDOR     ) );
               ShowLine( 'VERSION   ', GetDeviceInfo( D, CL_DEVICE_VERSION    ) );
               ShowLine( 'PROFILE   ', GetDeviceInfo( D, CL_DEVICE_PROFILE    ) );
               ShowLine( 'DRIVER    ', GetDeviceInfo( D, CL_DRIVER_VERSION    ) );
               ShowList( 'EXTENSIONS', GetDeviceInfo( D, CL_DEVICE_EXTENSIONS ) );
          end;

          Memo1.Lines.Add( '' );
     end;
end;

end. //######################################################################### Å°
