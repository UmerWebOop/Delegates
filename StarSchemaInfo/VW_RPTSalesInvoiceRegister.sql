CREATE VIEW [dbo].[VW_RPTSalesInvoiceRegister] 
AS
SELECT 	C.Company, SI.CustomerID, SI.SalesInvoiceNo, SI.Status, SI.CustomerPO, SI.SalesOrderNo, SI.InvoiceDate, SI.RefInvoiceNo,
	SI.InvoiceDate + SI.DiscountDays AS DiscountDate, SI.InvoiceDate + SI.DueDays AS DueDate, SI.SalesType, SI.InvoiceType, 
	SI.ShippingDate, SI.TotalAmount, SI.AppliedAmount, SI.AppliedDiscount, SI.PaymentDiscountAmount, SI.ServiceCharges, 
	SI.ShippingCharges, SI.HandlingCharges, SI.TaxAmount, 
	SI.TotalAmount- SI.ServiceCharges- SI.ShippingCharges- SI.HandlingCharges- SI.TaxAmount AS MerchandizeTotal, 
	SI.BatchNo, DocumentType =CASE 
	WHEN (SI.SalesType = 'SO0' AND SI.InvoiceType = 'S' AND TotalQty > 0) THEN 'SI' 
	WHEN (SI.SalesType = 'SO0' AND SI.InvoiceType = 'O') THEN 'OSI' 
	WHEN (SI.SalesType = 'CS0' AND SI.InvoiceType = 'S') THEN 'CI' 
	WHEN (SI.SalesType = 'SO0' AND SI.InvoiceType = 'S' AND TotalQty = 0) THEN 'CD' 
	WHEN (SI.SalesType = 'SO1' AND SI.InvoiceType = 'M' AND TotalQty > 0) THEN 'ZCR'  
	WHEN (SI.SalesType = 'SO1' AND SI.InvoiceType = 'M' AND TotalQty = 0) THEN 'ZCC' END, 
	PeriodID = SI.PeriodID, MiscAmount = SI.ServiceCharges + SI.ShippingCharges + SI.HandlingCharges, 
	ISNULL(U.UserID,'') UserID,
	ISNULL(R.Description,'') Region, ISNULL(CL.Description,'') Class,
	SI.NewPOSNo,CustomerCategory =  CC.Description	,SI.BDID,
	Convert(DateTime,Convert(VarChar,SI.AddDate,101)) AddDate		
FROM 	Customers C  WITH (NOLOCK) 
	INNER JOIN SalesInvoice SI  WITH (NOLOCK) ON C.CustomerID = SI.CustomerID 
	LEFT OUTER JOIN Users U     WITH (NOLOCK) ON U.UserNo = SI.AddUser
	LEFT OUTER JOIN Region R    WITH (NOLOCK) ON C.Region = R.RegionNo
	LEFT OUTER JOIN Class CL     WITH (NOLOCK) ON C.Class = CL.ClassNo
	LEFT OUTER JOIN Category CC WITH (NOLOCK) ON C.Category = CC.CategoryNo
WHERE 	SI.SalesType IN ('SO0', 'SO1', 'CS0') AND SI.Status <> '9'


GO