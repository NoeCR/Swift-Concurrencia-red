//
//  CategoryDetailResponse.swift
//  DiscourseClient
//
//  Created by Noe Cruz Rodriguez on 25/07/2021.
//

import Foundation

// MARK: - CategoryDetailResponse
struct CategoryDetailResponse: Codable {
    let category: DiscourseCategory
}

// MARK: - Category
struct DiscourseCategory: Codable {
    let id: Int
    let name, color, textColor, slug: String
    let topicCount, postCount, position: Int
    let categoryDescription, descriptionText, topicURL: String?
    let readRestricted: Bool
    let permission, notificationLevel: Int?
    let topicTemplate, hasChildren, sortOrder, sortAscending: String?
    let showSubcategoryList: Bool
    let numFeaturedTopics: Int
    let defaultView, subcategoryListStyle, defaultTopPeriod, defaultListFilter: String?
    let minimumRequiredTags: Int
    let navigateToFirstPostAfterRead: Bool
    let customFields: CustomFields
    let allowGlobalTags: Bool
    let autoCloseHours: String?
    let autoCloseBasedOnLastPost: Bool
    let groupPermissions: [GroupPermission]
    let mailinglistMirror, allTopicsWiki: Bool
    let cannotDeleteReason: String
    let allowBadges, topicFeaturedLinkAllowed: Bool
    let searchPriority: Int
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
        case customFields = "custom_fields"
        case allowGlobalTags = "allow_global_tags"
        case autoCloseHours = "auto_close_hours"
        case autoCloseBasedOnLastPost = "auto_close_based_on_last_post"
        case groupPermissions = "group_permissions"
        case mailinglistMirror = "mailinglist_mirror"
        case allTopicsWiki = "all_topics_wiki"
        case cannotDeleteReason = "cannot_delete_reason"
        case allowBadges = "allow_badges"
        case topicFeaturedLinkAllowed = "topic_featured_link_allowed"
        case searchPriority = "search_priority"
        case uploadedLogo = "uploaded_logo"
        case uploadedBackground = "uploaded_background"
    }
}

// MARK: - CustomFields
struct CustomFields: Codable {
}

// MARK: - GroupPermission
struct GroupPermission: Codable {
    let permissionType: Int
    let groupName: String

    enum CodingKeys: String, CodingKey {
        case permissionType = "permission_type"
        case groupName = "group_name"
    }
}

