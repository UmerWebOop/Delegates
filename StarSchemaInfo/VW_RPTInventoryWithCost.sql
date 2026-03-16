CREATE VIEW [dbo].[VW_RPTInventoryWithCost] 
AS
SELECT 	TOP 100 Percent LocationID, LocationType, ItemID, Description, SizeDescription, 
	ATSQty , Round(AvgCost,2)AS AvgCost,Round(TotalCost  ,2) AS TotalCost, Collection
FROM (
	SELECT 	IL.LocationID, L.LocationType, I.ItemID, I.Description, I.SizeDescription, 
		ATSQty = Qty - PickingTicketQty - SOrderQty,
		AvgCost = 	I.AvgCost,
		TotalCost = (Qty - PickingTicketQty - SOrderQty) * I.AvgCost,
		ISNULL(C.Description,'') Collection
	FROM 	Items I   WITH (NOLOCK) 
		INNER JOIN ItemLocation IL   WITH (NOLOCK) ON I.ItemID = IL.ItemID 
		LEFT OUTER JOIN Locations L   WITH (NOLOCK) ON IL.LocationID = L.LocationID 	
		LEFT OUTER JOIN Collections C   WITH (NOLOCK) ON I.Collection = C.CollectionNo
	WHERE I.ItemType = 'P' AND Qty - PickingTicketQty - SOrderQty > 0
	
	UNION ALL
	
	SELECT 	R.LocationID, L.LocationType, R.ItemID,  I.Description, I.SizeDescription, 
		ATSQty = Count(R.SKU) , 
		AvgCost= SUM(PurchasePrice) / Count(R.SKU),
		TotalCost= SUM(PurchasePrice),
		ISNULL(C.Description,'') Collection
	FROM 	RugsOAK R  WITH (NOLOCK) 
	 	INNER JOIN Items I   WITH (NOLOCK) ON R.ItemID = I.ItemID
		LEFT OUTER JOIN Locations L   WITH (NOLOCK) ON  R.LocationID = L.LocationID 
		LEFT OUTER JOIN Collections C   WITH (NOLOCK) ON I.Collection = C.CollectionNo
	WHERE 	ISNULL(LastPickingTicket,'') = ''
		AND R.ActualSQFT > 0
	GROUP BY R.LocationID,R.ItemID,L.LocationType, I.Description, ISNULL(C.Description,''), I.SizeDescription
) Items
ORDER BY LocationID,ItemID

GO


