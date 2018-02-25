Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Imports System.Drawing.Printing
Imports DevExpress.Web
Imports DevExpress.XtraCharts.Printing

Namespace PrintAndExport
    Partial Public Class MainPage
        Inherits System.Web.UI.Page

        Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        End Sub

        Protected Sub OnCbOrientationInit(ByVal sender As Object, ByVal e As EventArgs)
            If IsPostBack Then
                Return
            End If
            Dim comboBox As ASPxComboBox = TryCast(sender, ASPxComboBox)
            If comboBox Is Nothing Then
                Return
            End If
            comboBox.Items.Add(New ListEditItem("Portrait", False))
            comboBox.Items.Add(New ListEditItem("Landscape", True))
        End Sub

        Protected Sub OnCbSizeModeInit(ByVal sender As Object, ByVal e As EventArgs)
            If IsPostBack Then
                Return
            End If
            Dim comboBox As ASPxComboBox = TryCast(sender, ASPxComboBox)
            If comboBox Is Nothing Then
                Return
            End If
            Dim sizeModes As Array = System.Enum.GetValues(GetType(PrintSizeMode))
            For Each sizeMode As PrintSizeMode In sizeModes
                comboBox.Items.Add(New ListEditItem(sizeMode.ToString(), sizeMode.ToString()))
            Next sizeMode
        End Sub

        Protected Sub OnCbPaperKindInit(ByVal sender As Object, ByVal e As EventArgs)
            If IsPostBack Then
                Return
            End If
            Dim comboBox As ASPxComboBox = TryCast(sender, ASPxComboBox)
            If comboBox Is Nothing Then
                Return
            End If
            Dim paperKinds As Array = System.Enum.GetValues(GetType(PaperKind))
            For Each paperKind As PaperKind In paperKinds
                comboBox.Items.Add(New ListEditItem(paperKind.ToString(), paperKind.ToString()))
            Next paperKind
        End Sub
    End Class
End Namespace