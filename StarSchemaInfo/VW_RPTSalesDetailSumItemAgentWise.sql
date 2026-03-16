CREATE VIEW [dbo].[VW_RPTSalesDetailSumItemAgentWise] 
AS
SELECT 
	SI.SalesInvoiceNo, SID.CustomerID, ISNULL(C.Company,'') CustomerCompany, SI.SalesType, SI.InvoiceType, 
	SI.SalesOrderNo, SI.WareHouseID, SI.PackingSlipNo, SI.InvoiceDate, 
	ISNULL(I.DefaultVendor,'') AgentID, ISNULL(V.Company,'') VendorsCompany,
	SI.Status, SI.CustomerPO, 
	--DETAIL INFO 
	SID.Line_No, SID.SKU, I.ItemsCategory, I.Collection, I.DesignID, I.ColorsDescription, 
	I.SizeID, SID.UPC, ItemType = CASE WHEN LEFT(SID.UPC,1)='X'THEN'X'ELSE SID.ItemType END, SID.InvoicedQty, 
	SID.Price, SID.Discount, SID.ExtPrice, 
	ItemID = SID.ItemID, SizeDescription = CASE WHEN SID.SKU IS NULL THEN PROGSizeDesc ELSE SizeDescription END,
	ISNULL(CAT.Description,'') Category, ISNULL(CLS.Description,'') Class, ISNULL(R.Description,'') Region,
	SI.TotalAmount,	ISNULL(C.State,'') CustomerState,
	Convert(DateTime,Convert(Varchar,SI.AddDate,101)) AddDate ,
	OrderDate=SI.SODate,
	ProductType=I.CollectionDescription,
	DropShip= CASE WHEN ISNULL(SI.DropShipAddress,0) = 0 THEN 'NO' ELSE 'YES' END
FROM    SalesInvoice SI  WITH (NOLOCK) 
	INNER JOIN SalesInvoiceDetail SID  WITH (NOLOCK) ON SI.SalesInvoiceNo = SID.SalesInvoiceNo 
	LEFT OUTER JOIN Customers C  WITH (NOLOCK) ON SI.CustomerID = C.CustomerID
	LEFT OUTER JOIN Category CAT  WITH (NOLOCK) ON C.Category = CAT.CategoryNo
	LEFT OUTER JOIN Class CLS  WITH (NOLOCK) ON C.Class = CLS.ClassNo
	LEFT OUTER JOIN Region R  WITH (NOLOCK) ON C.Region = R.RegionNo
	INNER JOIN VW_RPT1PROGItems I   ON SID.ItemID = I.ItemID 
	LEFT OUTER JOIN RugsOAK OAK  WITH (NOLOCK) ON SID.SKU = OAK.SKU 
	LEFT OUTER JOIN	Vendors V  WITH (NOLOCK) ON I.DefaultVendor = V.VendorID

WHERE  	SI.SalesType IN ('SO0', 'CS0') AND SI.Status <> '9'


GO


