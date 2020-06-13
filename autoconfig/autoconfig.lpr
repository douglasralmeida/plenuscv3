{
    CONFIGURAÇÃO AUTOMÁTICA DO PLENUS

    Este programa realiza duas tarefas:
      * Configura o IP de acesso ao servidor CV3 usando balanceamento de carga.
      * Gera um código de acesso so servidor CV3 aleatório.

    O programa lerá os IPs disponíveis do arquivo cv3.ip. Em
    seguida, sorterará um IP aleatoriamente para salvar no
    arquivo de transportes do Plenus (plenus.trp).

    Ele espera encontrar duas linhas do arquivo que começam
    com a expressão Host=. Então adicionará o IP de acesso nas
    linhas encontradas.

    O CV3 possui dois IPs para acesso. Com o sorterio aleatório,
    espera-se que 50% das instalações usem o IP 1 e os 50% demais
    utilizem o IP 2.

    O programa gerará um código de 10 dígitos, letras e números, aleatoriamente
    para acesso ao Plenus.
}

program autoconfig;

{$mode objfpc}{$H+}{$codepage UTF8}

uses
  Classes, SysUtils, CustApp;

const
   TransportePlenus = 'plenus.trp';

var
  PlenusIP: Array of String;
  QuantidadeIPs: Integer;

type
  { TAplicacao }
  TAplicacao = class(TCustomApplication)
  protected
    procedure AbrirArquivoIPs;
    function EscolherIP: String;
    function GerarCodigo: String;
    procedure ProcessarConfiguracao;
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure ExibirAjuda;
  end;

{ TAplicacao }
constructor TAplicacao.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException := True;
end;

destructor TAplicacao.Destroy;
begin
  inherited Destroy;
end;

{
  Abre o arquivo passado como parâmetro e carrega os endereços
  IPs ali contidos para a memória.
}
procedure TAplicacao.AbrirArquivoIPs;
var
  I: Integer;
  ArquivoIP: TStringList;
  NomeArquivoIP: String;
begin
  //Recebe o nome do arquivo de IPs pela linha de comando
  NomeArquivoIP := GetParams(1);
  if not FileExists(NomeArquivoIP) then
    raise Exception.Create(Format('Arquivo de IPs %s não encontrado.', [NomeArquivoIP]));
  
  //Carrega o arquivo de IPs na memória
  ArquivoIP := TStringList.Create;
  ArquivoIP.LoadFromFile(NomeArquivoIP);
  QuantidadeIPs := ArquivoIP.Count;
  if QuantidadeIPs = 0 then
    raise Exception.Create(Format('Arquivo de IPs %s está vazio.', [NomeArquivoIP]));
  SetLength(PlenusIP, QuantidadeIPs);
  for I := 0 to QuantidadeIPs - 1 do
    PlenusIP[I] := ArquivoIP[I];
  ArquivoIP.Free;
end;

procedure TAplicacao.DoRun;
begin
  //análise sintática dos parametros
  if (GetParamCount < 1) or (HasOption('h', 'help')) then
  begin
    ExibirAjuda;
    Terminate;
    Exit;
  end;

  //processando...
  WriteLn('Configurando o IP do Plenus CV3...');
  try
    AbrirArquivoIPs;
    ProcessarConfiguracao;
  except
    on E: Exception do
    begin
      WriteLn('Erro: ', E.Message);
      Terminate;
      Exit;
    end;
  end;
  WriteLn('Operação executada com sucesso.');

  //para o loop do programa
  Terminate;
end;

{
  Escolhe um IP aleatoriamente
}
function TAplicacao.EscolherIP: String;
var
  I: Integer;
begin
  Randomize;
  I := Random(100) mod QuantidadeIPs;
  Result := PlenusIP[I];
end;

{
  Exibe ajuda da linha de comando
}
procedure TAplicacao.ExibirAjuda;
const
  stringUso = 'Uso: %s <nomearquivoips>';
begin
  WriteLn('CONFIGURADOR DO ENDEREÇO IP DE ACESSO AO PLENUS 1.1');
  WriteLn('====================================================');
  WriteLn('');
  WriteLn(Format(stringUso, [ExeName]));
  WriteLn('');
end;

{
  Gera uma sequencia de 10 digitos aleatoriamente.
}
function TAplicacao.GerarCodigo: String;
const
  Digitos: String = '0123456789QWERTYUIOPASDFGHJKLZXCVBNM'; //36 digitos
var
  I: Integer;
begin
  Result := '1234567890';
  Randomize;
  for I := 1 to 10 do
    Result[i] := Digitos[(Random(100) mod 36)+1];
end;

{
  Abre o arquivo de transporte do Plenus e insere o IP de conexão
  e o código de acesso sorteados aleatoriamente.
}
procedure TAplicacao.ProcessarConfiguracao;
var
  I: Integer;
  QuantidadeLinhas: Integer;
  ArquivoTransporte: TStringList;
  IPEscolhido: String;
begin
  //Carrega o arquivo de transporte do Plenus na memória
  if not FileExists(TransportePlenus) then
    raise Exception.Create('Arquivo de Transporte do Plenus CV3 não encontrado.');
  ArquivoTransporte := TStringList.Create;
  ArquivoTransporte.LoadFromFile(TransportePlenus);
  QuantidadeLinhas := ArquivoTransporte.Count;
  if QuantidadeLinhas = 0 then
    raise Exception.Create('Arquivo de Tranporte do Plenus CV3 está vazio.');

  //Sorteia um IP aleatoriamente e salva no arquivo de tranporte
  IPEscolhido := EscolherIP;
  for I := 0 to QuantidadeLinhas - 1 do
    if ArquivoTransporte[I].StartsWith('Host=') then
      ArquivoTransporte[I] := 'Host=' + IPEscolhido;
  
  //Gera um código de acesso aleatório e salva no arquivo de transporte
  ArquivoTransporte[9] := 'Nome=' + GerarCodigo;
  ArquivoTransporte.SaveToFile(TransportePlenus);
  ArquivoTransporte.Free;
end;

var
  App: TAplicacao;

{$R *.res}

begin
  App := TAplicacao.Create(nil);
  App.Title := 'Balanceador de Carga';
  App.Run;
  App.Free;
end.
