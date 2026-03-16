String getProductsQuery = r"""query Products {
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
                                                }
                                }
                }
}



""";
