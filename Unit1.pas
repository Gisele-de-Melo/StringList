//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    procedure ReadFromFile(const FileName: string);
    procedure WriteToFile(const FileName: string; const Lines: array of string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.WriteToFile(const FileName: string; const Lines: array of string);
var
  StringList: TStringList;
begin
  StringList := TStringList.Create;
  try
    //Adiciona as linhas na variável StringList
    StringList.AddStrings(Lines);
    //Salva o arquivo com as linhas adicionadas
    StringList.SaveToFile(FileName);
  finally
    StringList.Free;
  end;
end;

procedure TForm1.ReadFromFile(const FileName: string);
var
  StringList: TStringList;
  I: Integer;
begin
  StringList := TStringList.Create;
  try
    //Carrega o arquivo na variável StringList
    StringList.LoadFromFile(FileName);
    //Carrega as linhas do arquivo que estão armazenadas na StringList, no Memo1
    for I := 0 to StringList.Count - 1 do
      Memo1.Lines.Add(StringList[I]);
  finally
    StringList.Free;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  try
    //Insere cada linha no arquivo separada por vírgula pois o parâmetro Lines é um array de string
    //Esse arquivo será salvo na mesma pasta do executável do projeto.
    WriteToFile('example.txt', ['Hello, world!', 'Delphi is great!', 'File handling is simple!']);
    //Lê o arquivo que acabou de ser gravado
    ReadFromFile('example.txt');
  except
    on E: Exception do
      ShowMessage(E.ClassName+ ': '+ E.Message);
  end;
end;

end.
