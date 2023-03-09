unit UDM;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDM = class(TDataModule)
    Conexao: TSQLConnection;
    sqlMovimento: TSQLDataSet;
    dspMovimento: TDataSetProvider;
    cdsMovimento: TClientDataSet;
    dtsMovimento: TDataSource;
    sqlMovimentoIDMOVIMENTO: TIntegerField;
    sqlMovimentoCADASTRO: TDateField;
    sqlMovimentoUSUARIO: TStringField;
    sqlMovimentoTIPO: TStringField;
    sqlMovimentoVALOR: TFMTBCDField;
    cdsMovimentoIDMOVIMENTO: TIntegerField;
    cdsMovimentoCADASTRO: TDateField;
    cdsMovimentoUSUARIO: TStringField;
    cdsMovimentoTIPO: TStringField;
    cdsMovimentoVALOR: TFMTBCDField;
    dtsPesquisa: TDataSource;
    cdsPesquisa: TClientDataSet;
    dspPesquisa: TDataSetProvider;
    sqlPesquisa: TSQLDataSet;
    sqlPesquisaIDMOVIMENTO: TIntegerField;
    sqlPesquisaCADASTRO: TDateField;
    sqlPesquisaUSUARIO: TStringField;
    sqlPesquisaTIPO: TStringField;
    sqlPesquisaVALOR: TFMTBCDField;
    cdsPesquisaIDMOVIMENTO: TIntegerField;
    cdsPesquisaCADASTRO: TDateField;
    cdsPesquisaUSUARIO: TStringField;
    cdsPesquisaTIPO: TStringField;
    cdsPesquisaVALOR: TFMTBCDField;
    sqlUsuario: TSQLDataSet;
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    dtsUsuario: TDataSource;
    cdsUsuarioIDUSUARIO: TIntegerField;
    cdsUsuarioNOME: TStringField;
    cdsUsuarioSENHA: TStringField;
    cdsUsuarioTIPO: TStringField;
    cdsUsuarioCADASTRO: TDateField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
