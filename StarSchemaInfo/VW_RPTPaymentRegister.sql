CREATE VIEW [dbo].[VW_RPTPaymentRegister]
AS
SELECT 	V.ApplyPaymentNo, V.PaymentNo, V.PayDocNo, V.DocDate, V.PayableInvoiceNo, V.DiscountAccount, V.PaymentAccount, 
	V.VendorID, V.Amount, V.DiscountAmount, V.Reference, V.DocType, V.Status, V.ADDuser, 
	CONVERT(DATETIME,CONVERT(VARCHAR,V.ADDdate,101)) ADDdate, V.MODUser, 
	CONVERT(DATETIME,CONVERT(VARCHAR,V.MODDate,101)) MODDate, P.BankName
FROM 	VendorPayments V INNER JOIN PaymentAccounts P ON V.PaymentAccount = P.Account
WHERE 	V.Status <> 'V' AND ISNULL(V.PaymentNo,'') <> ''


GO


