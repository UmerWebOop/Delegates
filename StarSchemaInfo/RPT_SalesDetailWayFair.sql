ALTER VIEW [dbo].[RPT_SalesDetailWayFair] 
AS
SELECT 	--HEADER INFO
	SI.SalesInvoiceNo, SID.CustomerID, ISNULL(C.Company,'') CustomerCompany, SI.SalesType, SI.InvoiceType, 
	SI.SalesOrderNo, SI.WareHouseID, SI.PackingSlipNo, SI.InvoiceDate, 
	ISNULL(Agent.AgentID,'') AgentID, ISNULL(Agent.VendorsCompany,'') VendorsCompany,
	SI.Status, SI.CustomerPO, IA.S_Address1, IA.S_Address2, IA.S_City, IA.S_ZIP, IA.S_State, IA.S_Country, 
	IA.S_Phone, IA.S_Fax, IA.S_Email, SI.BillToAddress B_AddressID, IA.B_Address1, IA.B_Address2, IA.B_City, IA.B_State, IA.B_ZIP, IA.B_Country, 
	IA.B_Phone, IA.B_Fax, IA.B_Email,
	--DETAIL INFO 
	SID.Line_No, SID.ItemID OriginalRugID, SID.SKU, I.ItemsCategory, I.Collection, I.DesignID, I.ColorsDescription, 
	I.SizeID, SID.UPC, ItemType = CASE WHEN LEFT(SID.UPC,1)='X'THEN'X'ELSE SID.ItemType END, SID.InvoicedQty, 
	
	SID.Price, 
	SID.Discount, 
	DiscountPrice= SID.Price * (1-Discount/100), 
	SID.ExtPrice,
	 
	ItemID = SID.ItemID, SizeDescription = CASE WHEN SID.SKU IS NULL THEN PROGSizeDesc ELSE SizeDescription END,
	ISNULL(CAT.Description,'') Category, ISNULL(CLS.Description,'') Class, ISNULL(R.Description,'') Region,
	ISNULL(C.State,'') CustomerState,
	Convert(DateTime,Convert(Varchar,SI.AddDate,101)) AddDate,
	OrderType= CASE WHEN PoType = 'PR' Then 'PR' ELSE 'DS' END
FROM SalesInvoice SI   WITH (NOLOCK) 
	INNER JOIN SalesInvoiceDetail SID   WITH (NOLOCK) ON SI.SalesInvoiceNo = SID.SalesInvoiceNo 
	LEFT OUTER JOIN Customers C   WITH (NOLOCK) ON SI.CustomerID = C.CustomerID
	LEFT OUTER JOIN Category CAT   WITH (NOLOCK) ON C.Category = CAT.CategoryNo
	LEFT OUTER JOIN Class CLS   WITH (NOLOCK) ON C.Class = CLS.ClassNo
	LEFT OUTER JOIN Region R   WITH (NOLOCK) ON C.Region = R.RegionNo
	INNER JOIN VW_RPT1PROGItems I   ON SID.ItemID = I.ItemID 
	LEFT OUTER JOIN RugsOAK OAK   WITH (NOLOCK) ON SID.SKU = OAK.SKU 
	LEFT OUTER JOIN	InvoiceAddresses IA   WITH (NOLOCK) ON SI.SalesInvoiceNo = IA.SalesInvoiceNo
	LEFT OUTER JOIN	(
			SELECT 	SC.SalesInvoiceNo, MAX(SC.Agent) AS AgentID, MAX(SC.AgentType) AS AgentType, 
				MAX(V.Company) AS VendorsCompany
			FROM 	SalesCommissions SC   WITH (NOLOCK) INNER JOIN Vendors V   WITH (NOLOCK) ON SC.Agent = V.VendorID
			WHERE 	SC.Status <> '9' 
			GROUP BY SC.SalesInvoiceNo
			)Agent ON SI.SalesInvoiceNo = Agent.SalesInvoiceNo 			
	LEFT OUTER JOIN (
		SELECT  SalesOrderNo, PoType
		FROM    B_SalesOrders SO   WITH (NOLOCK) INNER JOIN B_INBOUNDHDR INB   WITH (NOLOCK) ON SO.B_inBoundHDRNo = INB.B_InboundHDRNo
	) INBH ON SI.SalesOrderNo = INBH.SalesOrderNo	
WHERE  	SI.SalesType IN ('SO0', 'CS0') AND SI.Status <> '9'
		 AND SI.CustomerID = 'CSN6172'

GO


