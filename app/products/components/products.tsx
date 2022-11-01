import { Suspense } from "react"
import { useQuery } from "@blitzjs/rpc"

import getProducts from "app/products/queries/getProducts"

function Products() {
  const [{ products }] = useQuery(getProducts, {})
  console.log("products: ", products)

  return <div>{products?.map((product) => product.name)}</div>
}

export function WrappedProducts() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        <Products />
      </Suspense>
    </div>
  )
}

export default WrappedProducts
