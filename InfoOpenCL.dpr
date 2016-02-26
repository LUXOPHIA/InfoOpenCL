program InfoOpenCL;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.Code.C in '_LIBRARY\LUXOPHIA\LUX.Code\LUX.Code.C.pas',
  OpenCL.cl_platform in '_LIBRARY\LUXOPHIA\LUX.GPGPU.OpenCL\OpenCL\OpenCL.cl_platform.pas',
  OpenCL.cl in '_LIBRARY\LUXOPHIA\LUX.GPGPU.OpenCL\OpenCL\OpenCL.cl.pas',
  LUX.GPGPU.OpenCL in '_LIBRARY\LUXOPHIA\LUX.GPGPU.OpenCL\LUX.GPGPU.OpenCL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
