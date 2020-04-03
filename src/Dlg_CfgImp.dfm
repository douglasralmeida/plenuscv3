object Dlg_CfgImp: TDlg_CfgImp
  Left = 552
  Top = 424
  ActiveControl = OKBtn
  BorderStyle = bsDialog
  Caption = 'Configuracoes Diversas'
  ClientHeight = 431
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Icon.Data = {
    0000010002002020100000000000E80200002600000020200200000000003001
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    077777777777777777777700000000000F888888888888888888887000000000
    0F8888888888888888888877000000000F888888888888888888887700000000
    0777777777777777777777770000000000000000000000000000000700000007
    77777777777777777777777000000078888888888888888888888887000000F8
    888888888888888888888887700000F8888888888888888888888887770000F8
    888888888888888888888887770000F8888888888888888888888887770000F8
    888888888888888889999887770000F8888888888888888888888887770000FF
    FFFFFFFFFFFFFFFFFFFFFFF77700000888888888888888888888888F77000000
    888800000000000000007888F700000000000FFFFFFFFFFFFFF0000000000000
    00000FFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFF0000000000000
    000077FFFFFFFFFFFFF7700000000000000000FFFFFFFFFFFFFF000000000000
    0000000FFFFFFFFFFFFFF0000000000000000000FFFFFFFFFFFFFF0000000000
    000000077FFFFFFFFFFFFF7700000000000000000FFFFFFFFFFFFFF000000000
    000000000FFFFFFFFFFFFFF00000000000000000000000000000000000000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFF000003FF000001FF000
    000FF0000007F0000007F0000007E0000007C000000780000007800000038000
    00018000000180000001800000018000000180000001C0000001E0000001F000
    0001FF0000FFFF0000FFFF00007FFF80007FFFC0003FFFE0001FFFE0000FFFF0
    000FFFF0000FFFF0000FFFFFFFFF280000002000000040000000010001000000
    0000000100000000000000000000000000000000000000000000FFFFFF000000
    0000000000000000000000000000040000000400000004000000000000000000
    0000000000000000000020000000200000002000000020000000200000002000
    00003FFFFFE00000001000000008007FFE0000600600007FFE0000200200003F
    FF0000180180000FFFC0000400C00007FFE00007FFE00000000000000000FFFF
    FFFFFFFFFFFFF000003FF000001FF000000FF0000007F0000007F0000007E000
    0007C00000078000000780000003800000018000000180000001800000018000
    000180000001C0000001E0000001F0000001FF0000FFFF0000FFFF00007FFF80
    007FFFC0003FFFE0001FFFE0000FFFF0000FFFF0000FFFF0000FFFFFFFFF}
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object OKBtn: TBitBtn
    Left = 418
    Top = 16
    Width = 80
    Height = 27
    TabOrder = 0
    Kind = bkOK
    Margin = 2
    Spacing = -1
    IsControl = True
  end
  object CancelBtn: TBitBtn
    Left = 418
    Top = 51
    Width = 80
    Height = 27
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = CancelBtnClick
    Kind = bkCancel
    Margin = 2
    Spacing = -1
    IsControl = True
  end
  object Gb_LibImpr: TGroupBox
    Left = 9
    Top = 296
    Width = 397
    Height = 50
    Caption = 'Liberacao da Impressao'
    TabOrder = 5
    object Lb_Apos: TLabel
      Left = 14
      Top = 22
      Width = 29
      Height = 14
      Caption = 'Apos'
    end
    object Lb_segundos: TLabel
      Left = 113
      Top = 22
      Width = 136
      Height = 14
      Caption = 'segundos sem atividade'
    end
    object Se_LibImpr: TSpinEdit
      Left = 56
      Top = 17
      Width = 48
      Height = 23
      MaxValue = 180
      MinValue = 0
      TabOrder = 0
      Value = 60
      OnChange = Se_LibImprChange
    end
  end
  object Gb_PrintToFile: TGroupBox
    Left = 9
    Top = 349
    Width = 397
    Height = 74
    Caption = 'Redirecionamento de Impressao'
    TabOrder = 6
    object Lb_ArqPrn: TLabel
      Left = 22
      Top = 47
      Width = 46
      Height = 14
      Caption = 'Arquivo:'
    end
    object Ckb_PrintToFile: TCheckBox
      Left = 22
      Top = 19
      Width = 160
      Height = 15
      Caption = 'Imprimir em arquivo'
      TabOrder = 0
      OnClick = Ckb_PrintToFileClick
    end
    object Ckb_Concat: TCheckBox
      Left = 190
      Top = 19
      Width = 164
      Height = 15
      Caption = 'Concatenar se ja existir'
      TabOrder = 1
      OnClick = Ckb_ConcatClick
    end
    object CB_PrnFileName: TComboBox
      Left = 86
      Top = 43
      Width = 286
      Height = 22
      ItemHeight = 14
      Items.Strings = (
        'lpt1:'
        'lpt2:'
        'lpt3:'
        'lpt4:')
      TabOrder = 2
      OnChange = CB_PrnFileNameChange
    end
  end
  object GB_Conversao: TGroupBox
    Left = 9
    Top = 224
    Width = 397
    Height = 70
    Caption = 'Conversao de sequencias'
    TabOrder = 4
    object Label1: TLabel
      Left = 17
      Top = 17
      Width = 14
      Height = 14
      Caption = 'De'
    end
    object Label2: TLabel
      Left = 198
      Top = 17
      Width = 24
      Height = 14
      Caption = 'Para'
    end
    object CB_De: TComboBox
      Left = 9
      Top = 34
      Width = 182
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 0
      OnChange = CB_DeChange
    end
    object CB_Para: TComboBox
      Left = 198
      Top = 34
      Width = 182
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 1
      OnChange = CB_ParaChange
    end
  end
  object GB_Spool: TGroupBox
    Left = 9
    Top = 112
    Width = 397
    Height = 104
    Caption = 'Spool'
    TabOrder = 3
    object Lb_SpoolCmd: TLabel
      Left = 9
      Top = 43
      Width = 56
      Height = 14
      Caption = 'Comando:'
    end
    object Lb_SpoolMode: TLabel
      Left = 9
      Top = 69
      Width = 34
      Height = 14
      Caption = 'Modo:'
    end
    object Ckb_Spool: TCheckBox
      Left = 9
      Top = 17
      Width = 113
      Height = 19
      Caption = 'Gerar arquivo'
      TabOrder = 0
      OnClick = Ckb_SpoolClick
    end
    object Ed_SpoolCmd: TEdit
      Left = 103
      Top = 40
      Width = 277
      Height = 22
      TabOrder = 1
      OnChange = Ed_SpoolCmdChange
    end
    object CB_SpoolMode: TComboBox
      Left = 103
      Top = 69
      Width = 157
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      Items.Strings = (
        'Normal'
        'Oculto'
        'Minimizado'
        'Maximizado')
      TabOrder = 2
      OnChange = CB_SpoolModeChange
    end
  end
  object GB_Diversos: TGroupBox
    Left = 9
    Top = 9
    Width = 397
    Height = 95
    Caption = 'Diversos'
    TabOrder = 2
    object Ckb_CRLF: TCheckBox
      Left = 9
      Top = 16
      Width = 119
      Height = 23
      Caption = 'CR -> CR + LF'
      Checked = True
      ParentShowHint = False
      ShowHint = False
      State = cbChecked
      TabOrder = 0
      OnClick = Ckb_CRLFClick
    end
    object Ckb_OverP: TCheckBox
      Left = 9
      Top = 34
      Width = 147
      Height = 22
      Caption = 'Interpretar "overprint"'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = Ckb_OverPClick
    end
    object Ckb_Filtra: TCheckBox
      Left = 216
      Top = 16
      Width = 173
      Height = 23
      Caption = 'Filtrar Caracteres de Controle'
      TabOrder = 1
      OnClick = Ckb_FiltraClick
    end
    object Ckb_Acentuacao: TCheckBox
      Left = 216
      Top = 34
      Width = 173
      Height = 19
      Caption = 'Interpretar acentuacao'
      TabOrder = 3
      OnClick = Ckb_AcentuacaoClick
    end
    object Ckb_ESCSOSI: TCheckBox
      Left = 216
      Top = 52
      Width = 173
      Height = 18
      Caption = 'ESC SO/ESC SI'
      TabOrder = 5
      OnClick = Ckb_ESCSOSIClick
    end
    object Ckb_Default: TCheckBox
      Left = 9
      Top = 52
      Width = 198
      Height = 18
      Caption = 'Usar impressora padrao do Windows'
      TabOrder = 4
      OnClick = Ckb_DefaultClick
    end
    object Ckb_SysTray: TCheckBox
      Left = 9
      Top = 69
      Width = 190
      Height = 18
      Caption = 'Exibir icone na bandeja de sistema'
      TabOrder = 6
      OnClick = Ckb_DefaultClick
    end
    object Ckb_Direct: TCheckBox
      Left = 216
      Top = 69
      Width = 173
      Height = 18
      Caption = 'Impressao direta'
      TabOrder = 7
      OnClick = Ckb_DefaultClick
    end
  end
end
