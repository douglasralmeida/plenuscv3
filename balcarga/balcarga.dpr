{
    BALANCEAMENTO DE CARGA

    Este programa irá procurar pelo arquivo Plenus.trp para
    configurar o IP de acesso do emulador Plenus ao servidor
    CV3 da Dataprev usando balanceamento de carga.

    O programa lerá os IPs disponíveis do arquivo cv3.ip. Em
    seguida sorterará um IP aleatóriamente para salvar no
    arquivo de transportes do Plenus (plenus.trp).

    Ele espera encontrar duas linhas do arquivo que começam
    com a expressão Host=. Então adicionará o IP de acesso nas
    linhas encontradas.

    O CV3 possui dois IPs para acesso. Com o sorterio aleatório,
    espera-se que 50% das instalações usem o IP 1 e os 50% demais
    utilizem o IP 2.
}

program balcarga;

{$APPTYPE CONSOLE}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

{$R *.res}

uses
  System.SysUtils, System.Classes, System.StrUtils;

const
   TransportePlenus = 'plenus.trp';

var
  PlenusIP: Array of String;
  QuantidadeIPs: Integer;

procedure AbrirArquivoIPs;
var
  I: Integer;
  ArquivoIP: TStringList;
  NomeArquivoIP: String;
begin
  NomeArquivoIP := ParamStr(1);
  if not FileExists(NomeArquivoIP) then
    raise Exception.Create('Arquivo de IPs do Plenus CV3 não encontrado.');
  ArquivoIP := TStringList.Create;
  ArquivoIP.LoadFromFile(NomeArquivoIP);
  QuantidadeIPs := ArquivoIP.Count;
  if QuantidadeIPs = 0 then
    raise Exception.Create('Arquivo de IPs está vazio.');
  SetLength(PlenusIP, QuantidadeIPs);
  for I := 0 to QuantidadeIPs - 1 do
    PlenusIP[I] := ArquivoIP[I];
  ArquivoIP.Free;
end;

function EscolherIP: String;
var
  I: Integer;
begin
  Randomize;
  I := Random(100) mod QuantidadeIPs;
  Result := PlenusIP[I];
end;

procedure ProcessarConfiguracao;
var
  I: Integer;
  QuantidadeLinhas: Integer;
  ArquivoTransporte: TStringList;
  IPEscolhido: String;
begin
  if not FileExists(TransportePlenus) then
    raise Exception.Create('Arquivo de Transporte do Plenus CV3 não encontrado.');
  ArquivoTransporte := TStringList.Create;
  ArquivoTransporte.LoadFromFile(TransportePlenus, TEncoding.ANSI);
  QuantidadeLinhas := ArquivoTransporte.Count;
  if QuantidadeLinhas = 0 then
    raise Exception.Create('Arquivo de Tranporte do Plenus CV3 está vazio.');
  IPEscolhido := EscolherIP;
  for I := 0 to QuantidadeLinhas - 1 do
    if StartsStr('Host=', ArquivoTransporte[I]) then
      ArquivoTransporte[I] := 'Host=' + IPEscolhido;
  ArquivoTransporte.SaveToFile(TransportePlenus, TEncoding.ANSI);
  ArquivoTransporte.Free;
end;

procedure ExibirTitulo;
const
  stringUso = 'Uso: %s <nomearquivoips>';

begin
  WriteLn('CONFIGURADOR DO ENDEREÇO IP DE ACESSO AO PLENUS 1.0.0');
  WriteLn('=====================================================');
  WriteLn('');
  WriteLn(Format(stringUso, [ParamStr(0)]));
end;

begin
  try
    if ParamCount < 1 then
    begin
      ExibirTitulo;
      Exit();
    end;
    WriteLn('Configurando o IP do Plenus CV3...');
    AbrirArquivoIPs;
    ProcessarConfiguracao;
    WriteLn('Operação executada com sucesso.');
  except
    on E: Exception do
      Writeln('Erro: ', E.Message);
  end;
end.
