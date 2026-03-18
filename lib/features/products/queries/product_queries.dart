class GraphQLQueries {
  static const String getProductsQuery = r"""
query Products {
  products(first: 10) {
    edges {
      cursor
      node {
        product_id: id
        isGiftCard
        onlineStoreUrl
        productType
        publishedAt
        requiresSellingPlan
        tags
        title
        totalInventory
        trackingParameters
        updatedAt
        vendor
        images(first: 5) {
          nodes {
            id
            url
            altText
          }
        }
      }
    }
  }
}
""";

  static const String getProductByIdQuery = r"""
query Product($id: ID!) {
  product(id: $id) {
    availableForSale
    createdAt
    description
    descriptionHtml
    encodedVariantAvailability
    encodedVariantExistence
    handle
    id
    isGiftCard
    onlineStoreUrl
    productType
    publishedAt
    requiresSellingPlan
    tags
    title
    totalInventory
    trackingParameters
    updatedAt
    vendor
    images(first: 5) {
      nodes {
        id
        url
        altText
      }
    }
  }
}
""";
}
