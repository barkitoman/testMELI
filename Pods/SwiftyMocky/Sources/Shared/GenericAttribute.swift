import Foundation

/// [Internal] Used as generic constraint for generic method stubs.
public protocol TypeErasedValue {
    /// [internal] Returned value
    var value: Any { get }
    /// [internal] Used to describe attribute generocity (0 is general, 1 is specific)
    var intValue: Int { get }
    /// [internal] Used to compare with other generic attributes values
    var compare: (Any,Any,Matcher) -> Bool { get }
    /// [internal] Used for formatting messages.
    var shortDescription: String { get }
}

/// [Internal] Used to wrap generic parameters, for sake of generic method stubs.
public struct GenericAttribute: TypeErasedValue {
    /// [internal] Returned value
    public let value: Any
    /// [internal] Used to describe attribute generocity (0 is general, 1 is specific)
    public var intValue: Int
    /// [internal] Used to compare with other generic attributes
    public let compare: (Any,Any,Matcher) -> Bool
    /// [internal] Used for formatting messages.
    public let shortDescription: String

    /// [internal] Creates new GenericAttribute instance, with specified return value and compare closure
    ///
    /// - Parameters:
    ///   - value: Returned value
    ///   - compare: Used to compare with other generic attributes values
    public init(
        value: Any,
        intValue: Int,
        shortDescription: String,
        compare: @escaping (Any,Any,Matcher) -> Bool
    ) {
        self.value = value
        self.intValue = intValue
        self.shortDescription = shortDescription
        self.compare = compare
    }
}

/// [Internal] Used to wrap availability constrained attributes, since enum cases used ubternally to
/// represent method/variable/subscript invocation/stub cannot have availability clauses.
public struct TypeErasedAttribute: TypeErasedValue {
    /// [internal] Returned value
    public let value: Any
    /// [internal] Used to describe attribute generocity (0 is general, 1 is specific)
    public var intValue: Int
    /// [internal] Used to compare with other attribute
    public let compare: (Any,Any,Matcher) -> Bool
    /// [internal] Used for formatting messages.
    public let shortDescription: String

    /// [internal] Creates new TypeErasedAttribute instance, with specified return value and compare closure
    ///
    /// - Parameters:
    ///   - value: Returned value
    ///   - compare: Used to compare with other attribute
    public init(
        value: Any,
        intValue: Int,
        shortDescription: String,
        compare: @escaping (Any,Any,Matcher) -> Bool
    ) {
        self.value = value
        self.intValue = intValue
        self.shortDescription = shortDescription
        self.compare = compare
    }
}
