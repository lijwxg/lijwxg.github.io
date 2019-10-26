<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [VBA](#vba)
  - [使用VBA使excel出现十字显示标记](#使用vba使excel出现十字显示标记)

<!-- /code_chunk_output -->
<!-- more -->
# VBA

## 使用VBA使excel出现十字显示标记

```VBA
Private Sub Worksheet_SelectionChange(ByVal Target As Range)
    If Target.EntireColumn.Address = Target.Address Then
        Cells.Interior.ColorIndex = xlNone
        Exit Sub
    End If
    If Target.EntireRow.Address = Target.Address Then
        Cells.Interior.ColorIndex = xlNone
        Exit Sub
    End If
    Cells.Interior.ColorIndex = xlNone
    Rows(Selection.Row & ":" & Selection.Row + Selection.Rows.Count - 1).Interior.ColorIndex = 10
    Columns(Selection.Column).Resize(, Selection.Columns.Count).Interior.ColorIndex = 10
End Sub
```