#Question 3

High-level description

My project is to realize a SaaS (Software as a Service) application that will allow supply chain and procurement teams from a company to manage their orders, inventory levels based on the information they upload to the application.  The application will use AI to identify what should be ordered based on their inventory levels or usage.

The users will mainly be supply chain managers and purchasing teams.  But it could be accessible for plant managers and inventory managers.

The core user scenarios or features are:
   * A user can create and manage purchase orders.
   * A user can track the procurement status of each product.
   * Users can view unit cost, unit price, and order quantity per item in an order.
   * A user can browse all products, including categories and reorder levels.
   * User can generate basic reports

Process: An user can check KPIs like pending orders and low stock items that needs to be reorder.  After that the user creates a new purchase order, selecting a product, enters the quantity and specifies the unit cost and order date.

After submitting the oder the user can view a delivery timeline and check if the product will arrive on time.  The user can  downloads a reports and filter them.


#Question 4

Data Model

Tables to use: 
- User
- Purchase Order
- Order item
- Product

Columns:

- Products
    + id
    + product id
    + name
    + category
    + unit of measure
    + unit cost
    + freight
    + unit price
Associaton: Order items

- Purchase Orders (PO)
    + id
    + PO number
    + PO date
    + ship date
    + delivery date
    + vendor id
Associations: Order items, 

- Order items
    + id
    + PO number
    + product id
    + order quantity
    + unit cost
    + freight
    + unit price
Associations: purchase order, products

ERD:
- products
    + id
    + product_id
    + name
    + category
    + uom
    + unit_cost
    + freight
    + unit_price


- Purchase Orders
    + id
    + PO_number
    + PO_date
    + ship_date
    + delivery_date
    + vendor_id

- Order items
    + id
    + PO_number
    + product_id
    + order_quantity
    + unit_cost
    + freight
    + unit_price
