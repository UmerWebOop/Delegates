CREATE VIEW [dbo].[RPTInventoryWithCostItemWise] 
AS
SELECT 	TOP 100 Percent WarehouseID, ItemID, Description,CutOffDate,
	ATSQty=ISNULL(ATSQty,0) , Round(AvgCost,2)AS AvgCost,Round(ISNULL(TotalCost,0)  ,2) AS TotalCost,
	CASE WHEN CategoryID = '' THEN 'BLANK' ELSE CategoryDesc END ProductTypeDesc,
	CASE WHEN CategoryID = '' THEN 'BLANK' ELSE CategoryID END ProductTypeID
FROM (
	SELECT IL.Location WarehouseID, I.ItemID, I.Description,CutOffDate='01-01-2020',
		ATSQty = IL.ATSQty,
		AvgCost = 	I.AvgCost,
		TotalCost = IL.ATSQty * I.AvgCost, ISNULL(R.Description,'') CategoryDesc,R.CategoryID
	FROM 	Items I   WITH (NOLOCK) 
		--INNER JOIN ItemLocationATS IL  WITH (NOLOCK) ON I.ItemID = IL.ItemID 
		INNER JOIN ItemLocationATSForWbins IL  WITH (NOLOCK) ON I.ItemID = IL.ItemID 
		LEFT OUTER JOIN RugCategories R WITH (NOLOCK) ON I.Category = R.CategoryID
	WHERE I.ItemType = 'P' AND IL.ATSQty > 0
	
	UNION ALL
	
	SELECT 	LEFT(R.LocationID, 3) WarehouseID, R.ItemID,  Description=MAX(I.Description),CutOffDate='01-01-2020',
		ATSQty = Count(R.SKU) , 
		AvgCost= 0,--SUM(PurchasePrice) / Count(R.SKU),
		TotalCost= SUM(PurchasePrice), ISNULL(RI.Description,'') CategoryDesc, RI.CategoryID
	FROM 	RugsOAK R  WITH (NOLOCK) 
	 	INNER JOIN Items I   WITH (NOLOCK) ON R.ItemID = I.ItemID
		LEFT OUTER JOIN RugCategories RI WITH (NOLOCK) ON I.Category = RI.CategoryID
	WHERE 	ISNULL(LastPickingTicket,'') = ''
		AND R.ActualSQFT > 0
	GROUP BY LEFT(R.LocationID, 3),R.ItemID, ISNULL(RI.Description,''),RI.CategoryID
	UNION ALL
	
	SELECT 	WarehouseID, R.ItemID,  Description= I.Description,CutOffDate,
		ATSQty = -ISNULL(R.Qty,0) , 
		AvgCost= 0,--ISNULL(R.Cost,0) / ISNULL(R.Qty,0),
		TotalCost= -ISNULL(TotalCost,0),  ISNULL(RI.Description,'') CategoryDesc, RI.CategoryID
	FROM 	RPTTempInventoryWithCostCategoryWise R  WITH (NOLOCK) 
	 	INNER JOIN Items I   WITH (NOLOCK) ON R.ItemID = I.ItemID
		LEFT OUTER JOIN RugCategories RI WITH (NOLOCK) ON I.Category = RI.CategoryID
		--GROUP BY R.WarehouseID ,R.ItemID, ISNULL(RI.Description,''),R.CategoryID

) Items
ORDER BY WarehouseID,ItemID

GO


