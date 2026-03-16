ALTER VIEW [dbo].[VW_RPTSalesInvoice] 
AS
SELECT  --Header Information
	SI.InvoiceType, SI.SalesInvoiceNo, BD.SalesInvoiceNo BackDateInvNo, SI.CustomerID, SI.CustomerPO, SI.BillToAddress, SI.Status, SI.Printed, 
	SI.SalesType, SI.ShipVia, SI.PaymentTerm, PT.Description PaymentTerms, SI.TaxRate, SI.OrderTakenBy, ISNULL(SI.TotalQtyInvoiced, 0) TotalQtyInvoiced, 
	ISNULL(SI.TotalQty, 0)TotalQty, ISNULL(SI.ServiceCharges, 0)ServiceCharges, ISNULL(SI.ShippingCharges, 0)SHCharges, SI.SpecialInstructions, 
	InvoiceDate = CASE WHEN BD.SalesInvoiceNo IS NULL THEN SI.InvoiceDate ELSE BD.BackDate END, ISNULL(SI.TotalAmount, 0) TotalAmount, SI.BatchNo, 
	SalesOrderNo= CASE WHEN Left(SI.SalesType,2) = 'CS' THEN SI.ConsignmentInvoiceNo ELSE SI.SalesOrderNo END, SI.RMANO, SI.RefInvoiceNo, 
	PriceFormat = CASE WHEN SI.PriceFormat = 'D' OR SI.PriceFormat IS NULL THEN CASE WHEN SID.ItemType = 'P' THEN 'UP' ELSE 'SQ' END
			   WHEN SI.PriceFormat = 'U' THEN'UP' WHEN SI.PriceFormat='S' THEN'SQ' END, SI.OrderPlacedBy, ISNULL(SI.TaxAmount,0) TaxAmount, 
	SI.PeriodID, SI.WarehouseID, SI.HandlingCharges, SI.DropShipAddress, SI.TotalWeight, SI.TotalSQFT, SI.TotalCUFT, SI.AppliedAmount, 
	SI.CustomerReturnNo, SI.PrintSetting, A.VendorsCompany SalesPersonName, A.AgentID Agent, C.ExcludeFromSigning,C.Process_810_Doc, Print_EDI_Invoice, 
	CustomerVendorCode, SO.CCPaymentNo, SO.CashReceiptNo, SO.CollateralCheckNo, LEFT(SO.SalesType,1) SOType, 

	--Bill To Address
	BTA.FirstName BillFirstName, BTA.LastName BillLastName, BTA.Address1 BillAddress1, BTA.Address2 BillAddress2, BTA.City BillCity, 
	BTA.State BillState, BTA.ZIP BillZip, BTA.Country BillCountry, BTA.Phone1 BillPhone1, BTA.Phone2 BillPhone2, 

	--Detail Information
	SID.Line_No, SID.ItemID, ItemDescription, SID.SQFTPrice, ItemType = CASE WHEN LEFT(SID.UPC,1) ='X' THEN 'X' ELSE SID.ItemType END, SID.SKU, SID.CustomerItemCode, 
	ISNULL(SID.InvoicedQty, 0) InvoicedQty, ISNULL(SID.Price, 0) Price, SID.Discount, ISNULL(SID.ExtPrice, 0) ExtPrice, ISNULL(SID.ShippedQty, 0) ShippedQty, 
	SID.Taxable, UPC = CASE WHEN LEFT(SID.UPC, 1) <> 'X' THEN SUBSTRING(SID.UPC, 7, 5) ELSE NULL END, ISNULL(SID.ReturnQty, 0) ReturnQty, 
	ISNULL(SID.OrderQty, 0) OrderQty, SID.MarkFor, SID.LocationID, SID.PrintOnInvoice, SID.PriceCategory, PC.Description PriceCategoriesDesc,  
	
	--Items Properties
	SID.Collection, SID.Color, SID.Design, SID.Size, SID.SpecialItemDesc, SID.ItemsCategoryDescription, SID.OAK_Size, SID.Area, ISNULL(SID.ActualLength, 0) ActualLength, 
	ISNULL(SID.ActualWidth, 0) ActualWidth, 

	--Ship to Address
	ShipToAddress= CASE WHEN SI.DropShipAddress = 0 THEN SI.ShipToAddress ELSE 'MISC' END , 
	ShipFirstName= CASE WHEN SI.DropShipAddress = 0 THEN STA.FirstName ELSE DSA.FirstName END, 
	ShipLastName = CASE WHEN SI.DropShipAddress = 0 THEN STA.LastName  ELSE DSA.LastName  END, 
	ShipAddress1 = CASE WHEN SI.DropShipAddress = 0 THEN STA.Address1  ELSE DSA.Address1  END, 
	ShipAddress2 = CASE WHEN SI.DropShipAddress = 0 THEN STA.Address2  ELSE DSA.Address2  END, 
	ShipCity     = CASE WHEN SI.DropShipAddress = 0 THEN STA.City      ELSE DSA.City      END,
	ShipState    = CASE WHEN SI.DropShipAddress = 0 THEN STA.State     ELSE DSA.State     END,
	ShipZip      = CASE WHEN SI.DropShipAddress = 0 THEN STA.ZIP       ELSE DSA.ZIP       END,
	ShipCountry  = CASE WHEN SI.DropShipAddress = 0 THEN STA.Country   ELSE DSA.Country   END,
	ShipPhone1   = CASE WHEN SI.DropShipAddress = 0 THEN STA.Phone1    ELSE DSA.Phone     END,
	SI.POSInvoice, SID.TrackingNo, SI.ManualDocNo, ISNULL(SI.BDID,'') BDID,
	WHAddress = CASE WHEN ISNULL(SI.WarehouseID,'') = 'L28' AND ISNULL(SI.BDID,'') <> '026' THEN '1991 Northhampton St. EASTON, PA 18042' 
					 ELSE '40 Harbor Park Drive North, Port Washington, NY 11050'
				END,	
	WHPhFax = CASE  WHEN ISNULL(SI.BDID,'') = '026' THEN 'Phone: (516) 945-1900   Fax: (516) 945-1938'
					ELSE 'Phone: (516) 945-1900   Fax: (516) 945-1938 www.safavieh.com'
				END
FROM    SalesInvoice SI WITH (NOLOCK)
	LEFT OUTER JOIN VW_RPT1SalesInvoiceDetailWithServices SID ON SID.SalesInvoiceNo = SI.SalesInvoiceNo
	LEFT OUTER JOIN	CustomerAddresses STA WITH (NOLOCK) ON SI.CustomerID = STA.CustomerID AND SI.ShipToAddress = STA.AddressID
	LEFT OUTER JOIN CustomerAddresses BTA WITH (NOLOCK) ON BTA.AddressID = SI.BillToAddress AND BTA.CustomerID = SI.CustomerID 
	LEFT OUTER JOIN DropShipAddress DSA WITH (NOLOCK) ON SI.SalesInvoiceNo = DSA.SalesInvoiceNo
	LEFT OUTER JOIN Customers C WITH (NOLOCK) ON SI.CustomerID = C.CustomerID 
	LEFT OUTER JOIN PriceCategories PC WITH (NOLOCK) ON PC.CategoryNo = SID.PriceCategory 
	LEFT OUTER JOIN PaymentTerms PT WITH (NOLOCK) ON PT.PaymentTermNo = SI.PaymentTerm 
	LEFT OUTER JOIN	SalesOrders SO WITH (NOLOCK) ON SI.SalesOrderNo = SO.SalesOrderNo 
	LEFT OUTER JOIN BackDateInvoicePrinting BD WITH (NOLOCK) ON SI.SalesInvoiceNo = BD.SalesInvoiceNo 
	LEFT OUTER JOIN	VW_RPT1AgentFromSalesCommission A ON SI.SalesInvoiceNo = A.SalesInvoiceNo


GO


