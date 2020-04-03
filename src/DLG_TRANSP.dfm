object Dlg_Transp: TDlg_Transp
  Left = 234
  Top = 162
  ActiveControl = OKBtn
  BorderStyle = bsDialog
  Caption = 'Transporte'
  ClientHeight = 198
  ClientWidth = 316
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
  TextHeight = 16
  object Bevel1: TBevel
    Left = 8
    Top = 54
    Width = 295
    Height = 46
    Shape = bsFrame
    IsControl = True
  end
  object Bevel2: TBevel
    Left = 6
    Top = 111
    Width = 296
    Height = 46
  end
  object Lb_Arquivo: TLabel
    Left = 19
    Top = 45
    Width = 46
    Height = 16
    Caption = 'Arquivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Lb_Transp: TLabel
    Left = 19
    Top = 102
    Width = 66
    Height = 16
    Caption = 'Transporte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 39
    Shape = bsFrame
  end
  object OKBtn: TBitBtn
    Left = 146
    Top = 166
    Width = 72
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = OKBtnClick
    Kind = bkOK
    Margin = 2
    Spacing = -1
    IsControl = True
  end
  object CancelBtn: TBitBtn
    Left = 229
    Top = 166
    Width = 73
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = CancelBtnClick
    Kind = bkCancel
    Margin = 2
    Spacing = -1
    IsControl = True
  end
  object Ed_NomeArq: TEdit
    Left = 19
    Top = 67
    Width = 219
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = Ed_NomeArqChange
  end
  object Bt_Procurar: TButton
    Left = 243
    Top = 66
    Width = 52
    Height = 25
    Caption = 'Procurar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Bt_ProcurarClick
  end
  object Cb_Transp: TComboBox
    Left = 19
    Top = 121
    Width = 276
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 4
    OnChange = Cb_TranspChange
  end
  object Ckb_Lpd: TCheckBox
    Left = 15
    Top = 20
    Width = 282
    Height = 17
    Caption = 'LPD  ( Line Printer Daemon )'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Ckb_LpdClick
  end
  object Rp_OpenDlg: TOpenDialog
    Filter = 'Arquivo de Transporte (*.TRP)|*.trp'
    Options = [ofHideReadOnly, ofFileMustExist]
    Left = 8
    Top = 166
  end
end
