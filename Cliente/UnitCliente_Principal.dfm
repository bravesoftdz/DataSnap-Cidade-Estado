object Cliente_Principal: TCliente_Principal
  Left = 0
  Top = 0
  Caption = 'Estado/Cidade'
  ClientHeight = 400
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 400
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 655
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 0
      object Button1: TButton
        Left = 0
        Top = 0
        Width = 175
        Height = 49
        Action = ActEstado
        Align = alLeft
        Style = bsCommandLink
        TabOrder = 0
      end
      object Button2: TButton
        Left = 175
        Top = 0
        Width = 175
        Height = 49
        Action = ActCidade
        Align = alLeft
        Style = bsCommandLink
        TabOrder = 1
      end
    end
  end
  object Act: TActionList
    Left = 32
    Top = 336
    object ActEstado: TAction
      Caption = 'Estado'
      OnExecute = ActEstadoExecute
    end
    object ActCidade: TAction
      Caption = 'Cidade'
      OnExecute = ActCidadeExecute
    end
  end
end
