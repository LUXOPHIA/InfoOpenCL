unit LUX.GPGPU.OpenCL;

interface //#################################################################### ■

uses OpenCL.cl_platform, OpenCL.cl,
     LUX.Code.C;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetPlatformIDs :TArray<T_cl_platform_id>;

function GetPlatformInfo( const ID_:T_cl_platform_id; const Info_:T_cl_platform_info ) :TArray<T_char>;

function GetDeviceIDs( const Platform_:T_cl_platform_id; const Type_:T_cl_device_type ) :TArray<T_cl_device_id>;

function GetDeviceInfo( const ID_:T_cl_device_id; const Info_:T_cl_device_info ) :TArray<T_char>;

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetPlatformIDs :TArray<T_cl_platform_id>;
var
   N :T_cl_uint;
begin
     Result := nil;

     if clGetPlatformIDs( 0, nil       , @N  ) <> CL_SUCCESS then Exit;

     SetLength( Result, N );

     if clGetPlatformIDs( N, @Result[0], nil ) <> CL_SUCCESS then Exit;
end;

function GetPlatformInfo( const ID_:T_cl_platform_id; const Info_:T_cl_platform_info ) :TArray<T_char>;
var
   N :T_cl_uint;
begin
     Result := nil;

     if clGetPlatformInfo( ID_, Info_, 0, nil       , @N  ) <> CL_SUCCESS then Exit;

     SetLength( Result, N );

     if clGetPlatformInfo( ID_, Info_, N, @Result[0], nil ) <> CL_SUCCESS then Exit;
end;

function GetDeviceIDs( const Platform_:T_cl_platform_id; const Type_:T_cl_device_type ) :TArray<T_cl_device_id>;
var
   N :T_cl_uint;
begin
     Result := nil;

     if clGetDeviceIDs( Platform_, Type_, 0, nil       , @N  ) <> CL_SUCCESS then Exit;

     SetLength( Result, N );

     if clGetDeviceIDs( Platform_, Type_, N, @Result[0], nil ) <> CL_SUCCESS then Exit;
end;

function GetDeviceInfo( const ID_:T_cl_device_id; const Info_:T_cl_device_info ) :TArray<T_char>;
var
   N :T_cl_uint;
begin
     Result := nil;

     if clGetDeviceInfo( ID_, Info_, 0, nil       , @N  ) <> CL_SUCCESS then Exit;

     SetLength( Result, N );

     if clGetDeviceInfo( ID_, Info_, N, @Result[0], nil ) <> CL_SUCCESS then Exit;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
