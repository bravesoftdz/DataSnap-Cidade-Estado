object Cad_Estado: TCad_Estado
  Left = 0
  Top = 0
  Caption = 'Estado'
  ClientHeight = 369
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = '@Malgun Gothic'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 369
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 105
      Height = 369
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Button1: TButton
        Left = 0
        Top = 0
        Width = 105
        Height = 45
        Action = ActIncluir
        Align = alTop
        Style = bsCommandLink
        TabOrder = 0
      end
      object Button2: TButton
        Left = 0
        Top = 45
        Width = 105
        Height = 45
        Action = ActAlterar
        Align = alTop
        Style = bsCommandLink
        TabOrder = 1
      end
      object Button3: TButton
        Left = 0
        Top = 90
        Width = 105
        Height = 45
        Action = ActExcluir
        Align = alTop
        Style = bsCommandLink
        TabOrder = 2
      end
      object Button4: TButton
        Left = 0
        Top = 324
        Width = 105
        Height = 45
        Action = ActSair
        Align = alBottom
        Style = bsCommandLink
        TabOrder = 3
      end
      object Button6: TButton
        Left = 0
        Top = 135
        Width = 105
        Height = 41
        Action = ActSalvar
        Align = alTop
        Style = bsCommandLink
        TabOrder = 4
        ExplicitLeft = 56
        ExplicitTop = 192
        ExplicitWidth = 75
        ExplicitHeight = 25
      end
    end
    object PageControl1: TPageControl
      Left = 105
      Top = 0
      Width = 592
      Height = 369
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Dados'
        object Label2: TLabel
          Left = 3
          Top = 21
          Width = 25
          Height = 13
          Caption = 'Cod.:'
        end
        object Label3: TLabel
          Left = 152
          Top = 21
          Width = 22
          Height = 13
          Caption = 'Pa'#237's:'
        end
        object Label4: TLabel
          Left = 304
          Top = 21
          Width = 67
          Height = 13
          Caption = 'C'#243'digo IBGE:'
        end
        object Label5: TLabel
          Left = 3
          Top = 83
          Width = 33
          Height = 13
          Caption = 'Nome:'
        end
        object Label6: TLabel
          Left = 456
          Top = 21
          Width = 27
          Height = 13
          Caption = 'Sigla:'
        end
        object edtCod: TEdit
          Left = 3
          Top = 40
          Width = 121
          Height = 21
          Color = clInactiveCaption
          Enabled = False
          TabOrder = 0
        end
        object edtPais: TEdit
          Left = 152
          Top = 40
          Width = 121
          Height = 21
          NumbersOnly = True
          TabOrder = 1
        end
        object edtIBGE: TEdit
          Left = 304
          Top = 40
          Width = 121
          Height = 21
          NumbersOnly = True
          TabOrder = 2
        end
        object edtNome: TEdit
          Left = 3
          Top = 102
          Width = 574
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object edtSigla: TEdit
          Left = 456
          Top = 40
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Lista'
        ImageIndex = 1
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 49
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 2
            Top = 2
            Width = 46
            Height = 13
            Caption = 'Pesquisa:'
          end
          object edtPesquisa: TEdit
            Left = 2
            Top = 16
            Width = 399
            Height = 21
            TabOrder = 0
          end
          object Button5: TButton
            Left = 407
            Top = 2
            Width = 114
            Height = 41
            Action = ActPesquisa
            Style = bsCommandLink
            TabOrder = 1
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 49
          Width = 584
          Height = 292
          Align = alClient
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = '@Malgun Gothic'
          TitleFont.Style = []
        end
      end
    end
  end
  object ActiEstado: TActionList
    Left = 32
    Top = 200
    object ActIncluir: TAction
      Caption = 'Incluir'
    end
    object ActAlterar: TAction
      Caption = 'Alterar'
    end
    object ActExcluir: TAction
      Caption = 'Excluir'
    end
    object ActSair: TAction
      Caption = 'Sair'
    end
    object ActPesquisa: TAction
      Caption = 'Pesquisar'
    end
    object ActSalvar: TAction
      Caption = 'Salvar'
    end
  end
end