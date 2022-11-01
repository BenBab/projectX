-- CreateTable
CREATE TABLE "Product_item" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "groupSize" TEXT NOT NULL,
    "productId" INTEGER,

    CONSTRAINT "Product_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Loaned_product" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "dateLoaned" TIMESTAMP(3) NOT NULL,
    "dateDue" TIMESTAMP(3) NOT NULL,
    "dateReturned" TIMESTAMP(3) NOT NULL,
    "loanStatus" TEXT NOT NULL,
    "product_itemId" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,

    CONSTRAINT "Loaned_product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Product_item" ADD CONSTRAINT "Product_item_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Loaned_product" ADD CONSTRAINT "Loaned_product_product_itemId_fkey" FOREIGN KEY ("product_itemId") REFERENCES "Product_item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Loaned_product" ADD CONSTRAINT "Loaned_product_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
