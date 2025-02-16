--1.1
SELECT 
   product.ProductId,
   product.Name,
   product.ProductNumber,
   product.size,
   product.color,
   pro_subcat.ProductSubcategoryId,
   pro_subcat.name SubCategory
FROM `adwentureworks_db.product` product
JOIN `adwentureworks_db.productsubcategory` pro_subcat
  ON product.ProductSubcategoryID=pro_subcat.ProductSubcategoryID
ORDER By SubCategory;

--1.2
SELECT
   product.ProductId,
   product.Name,
   product.ProductNumber,
   product.size, 
   product.color,
   pro_subcat.ProductSubcategoryId,
   pro_subcat.name SubCategory,
   pro_cat.name category 
FROM `adwentureworks_db.product` product
JOIN `adwentureworks_db.productsubcategory` pro_subcat
   ON product.ProductSubcategoryID=pro_subcat.ProductSubcategoryID
JOIN `adwentureworks_db.productcategory` pro_cat
   ON pro_subcat.ProductCategoryID=pro_cat.ProductCategoryID
ORDER By Category;

--1.3
SELECT
  product.ProductId,
  product.Name,
  product.ListPrice,
  product.ProductNumber,
  product.size,
  product.color,
  pro_subcat.ProductSubcategoryId,
  pro_subcat.name SubCategory,
  pro_cat.name category
FROM `adwentureworks_db.product` product
JOIN `adwentureworks_db.productsubcategory` pro_subcat
   ON product.ProductSubcategoryID=pro_subcat.ProductSubcategoryID
   AND product.SellEndDate IS NULL
   AND product.ListPrice>2000
JOIN `adwentureworks_db.productcategory` pro_cat
   ON pro_subcat.ProductCategoryID=pro_cat.ProductCategoryID
   AND pro_cat.name="Bikes"
ORDER By product.ListPrice DESC;

--2.1
SELECT
   wr.LocationID,
   COUNT(DISTINCT w.workorderid) no_work_orders,
   COUNT(DISTINCT p.productid) no_unique_products,
   SUM(wr.actualcost) actual_cost
FROM `adwentureworks_db.product` p
JOIN `adwentureworks_db.workorder` w
   ON p.productid =w.ProductID
JOIN `adwentureworks_db.workorderrouting` wr
   ON w.WorkOrderID=wr.WorkOrderID
   AND wr.ActualStartDate BETWEEN "2004-01-01T00:00:00" AND "2004-01-31T00:00:00"
GROUP BY wr.LocationID
ORDER BY actual_cost DESC;

--2.2
SELECT
  l.locationid,
  l.Name,
  COUNT(DISTINCT w.workorderid) no_work_orders,
  COUNT(DISTINCT p.productid) no_unique_products,
  SUM(wr.actualcost) actual_cost,
  ROUND(AVG(DATE_DIFF(wr.ActualEndDate, wr.ActualStartDate, DAY)),2) AS avg_days_difference
FROM `adwentureworks_db.product`p
JOIN `adwentureworks_db.workorder` w
  ON p.productid =w.ProductID
JOIN `adwentureworks_db.workorderrouting` wr
  ON w.WorkOrderID=wr.WorkOrderID
JOIN `adwentureworks_db.location` l
  ON wr.LocationID=l.LocationID
  AND wr.ActualStartDate BETWEEN "2004-01-01T00:00:00" AND "2004-01-31T00:00:00"
GROUP BY l.LocationID, l.Name
ORDER BY avg_days_difference DESC ;

--2.3
SELECT
  wr.workorderid,
  SUM(wr.ActualCost) actual_cost
FROM `adwentureworks_db.workorderrouting` wr
WHERE wr.ActualStartDate BETWEEN "2004-01-01T00:00:00" AND "2004-01-31T00:00:00"
GROUP BY wr.WorkOrderID
HAVING actual_cost>300
ORDER BY actual_cost DESC;

--3.1
SELECT sales_detail.SalesOrderID
,product.name
,SUM(sales_detail.OrderQty) Order_Qty
,ROUND(SUM(sales_detail.LineTotal),2) line_total
,spec_offer.Description
FROM `tc-da-1.adwentureworks_db.salesorderdetail` as sales_detail
JOIN `tc-da-1.adwentureworks_db.specialoffer` as spec_offer
   ON sales_detail.SpecialOfferID = spec_offer.SpecialOfferID
   AND spec_offer.SpecialOfferID<>1
JOIN `adwentureworks_db.product` as product
   ON product.ProductID=sales_detail.ProductID
GROUP BY sales_detail.SalesOrderID,product.name,spec_offer.Description
ORDER BY line_total DESC;

/*Changes:
reduced number of columns to focus on relevant information
aggregated the sales qty and sales value
replaced left join by join to focus on intersecting results
replaced special offer product table  with product table to provide information on product on offer*/

--3.2
--Debbuged Query
SELECT a.VendorId as Id,vendor_contact.ContactId, vendor_contact.ContactTypeId, a.Name, a.CreditRating, a.ActiveFlag, c.AddressId,address.City
FROM `adwentureworks_db.vendor` as a
left join `adwentureworks_db.vendorcontact` as vendor_contact on a.VendorId = vendor_contact.VendorId
left join `adwentureworks_db.vendoraddress` as c on a.VendorId = c.VendorId
left join `adventureworks_db_v19.Address` as address on c.addressId = address.addressID


/*Recommendation
 Use aliases that represent the table or column they refer to instead of single characters like a,b,c
write different join statements in different lines
make sure you're using correct db address
Check for primary keys and foreign keys before joining the table
Use line breaks and end the query with ; */

--updated query
SELECT vendor.VendorId as Id,
   vendor_contact.ContactId,
   vendor_contact.ContactTypeId,
   vendor.Name,
   vendor.CreditRating,
   vendor.ActiveFlag,
   ven_add.AddressId,
   address.City
FROM `adwentureworks_db.vendor` AS vendor
LEFT JOIN `adwentureworks_db.vendorcontact` AS vendor_contact
   ON vendor.VendorId = vendor_contact.VendorId
LEFT JOIN `adwentureworks_db.vendoraddress` AS ven_add
   ON vendor.VendorId = ven_add.VendorId
LEFT JOIN `adwentureworks_db.address` AS address
   ON ven_add.addressId = address.addressID;
