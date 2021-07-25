// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categoriesResponse = try? newJSONDecoder().decode(CategoriesResponse.self, from: jsonData)

import Foundation

// MARK: - CategoriesResponse
struct CategoriesResponse: Codable {
    let categoryList: CategoryList

    enum CodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }
}

// MARK: - CategoryList
struct CategoryList: Codable {
    let canCreateCategory, canCreateTopic: Bool
    let categories: [Category]

    enum CodingKeys: String, CodingKey {
        case canCreateCategory = "can_create_category"
        case canCreateTopic = "can_create_topic"
        case categories
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name, color, textColor, slug: String
    let topicCount, postCount, position: Int
    let categoryDescription, descriptionText, descriptionExcerpt, topicURL: String?
    let readRestricted: Bool
    let permission, notificationLevel: Int
    let topicTemplate: String?
    let hasChildren: Bool
    let sortOrder, sortAscending: String?
    let showSubcategoryList: Bool
    let numFeaturedTopics: Int
    let defaultView, subcategoryListStyle, defaultTopPeriod, defaultListFilter: String?
    let minimumRequiredTags: Int
    let navigateToFirstPostAfterRead: Bool
    let topicsDay, topicsWeek, topicsMonth, topicsYear: Int
    let topicsAllTime: Int
    let uploadedLogo, uploadedBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name, color
        case textColor = "text_color"
        case slug
        case topicCount = "topic_count"
        case postCount = "post_count"
        case position
        case categoryDescription = "description"
        case descriptionText = "description_text"
        case descriptionExcerpt = "description_excerpt"
        case topicURL = "topic_url"
        case readRestricted = "read_restricted"
        case permission
        case notificationLevel = "notification_level"
        case topicTemplate = "topic_template"
        case hasChildren = "has_children"
        case sortOrder = "sort_order"
        case sortAscending = "sort_ascending"
        case showSubcategoryList = "show_subcategory_list"
        case numFeaturedTopics = "num_featured_topics"
        case defaultView = "default_view"
        case subcategoryListStyle = "subcategory_list_style"
        case defaultTopPeriod = "default_top_period"
        case defaultListFilter = "default_list_filter"
        case minimumRequiredTags = "minimum_required_tags"
        case navigateToFirstPostAfterRead = "navigate_to_first_post_after_read"
        case topicsDay = "topics_day"
        case topicsWeek = "topics_week"
        case topicsMonth = "topics_month"
        case topicsYear = "topics_year"
        case topicsAllTime = "topics_all_time"
        case uploadedLogo = "uploaded_logo"
        case uploadedBackground = "uploaded_background"
    }
}

