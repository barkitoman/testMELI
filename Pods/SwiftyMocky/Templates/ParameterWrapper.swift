class ParameterWrapper {
    let parameter: MethodParameter

    var isVariadic = false

    var wrappedForCall: String {
        let typeString = "\(type.actualTypeName ?? type)"
        let isEscaping = typeString.contains("@escaping")
        let isOptional = (type.actualTypeName ?? type).isOptional
        if parameter.isClosure && !isEscaping && !isOptional {
            return "\(nestedType).any"
        } else {
            return "\(nestedType).value(\(escapedName))"
        }
    }
    var nestedType: String {
        return "\(TypeWrapper(type, isVariadic).nestedParameter)"
    }
    var justType: String {
        return "\(TypeWrapper(type, isVariadic).replacingSelf())"
    }
    var justPerformType: String {
        return "\(TypeWrapper(type, isVariadic).replacingSelfRespectingVariadic())".replacingOccurrences(of: "!", with: "?")
    }
    var genericType: String {
        return isVariadic ? "Parameter<[GenericAttribute]>" : "Parameter<GenericAttribute>"
    }
    var typeErasedType: String {
        return isVariadic ? "Parameter<[TypeErasedAttribute]>" : "Parameter<TypeErasedAttribute>"
    }
    var type: SourceryRuntime.TypeName {
        return parameter.typeName
    }
    var name: String {
        return parameter.name
    }
    var escapedName: String {
        return "`\(parameter.name)`"
    }
    var comparator: String {
        return "guard Parameter.compare(lhs: lhs\(parameter.name.capitalized), rhs: rhs\(parameter.name.capitalized), with: matcher) else { return false }"
    }
    func comparatorResult() -> String {
        let lhsName = "lhs\(parameter.name.capitalized)"
        let rhsName = "rhs\(parameter.name.capitalized)"
        return "results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: \(lhsName), rhs: \(rhsName), with: matcher), \(lhsName), \(rhsName), \"\(labelAndName())\"))"
    }

    init(_ parameter: SourceryRuntime.MethodParameter, _ variadics: [String] = []) {
        self.parameter = parameter
        self.isVariadic = !variadics.isEmpty && variadics.contains(parameter.name)
    }

    func isGeneric(_ types: [String]) -> Bool {
        return TypeWrapper(type).isGeneric(types)
    }

    func wrappedForProxy(_ generics: [String], _ availability: Bool = false) -> String {
        if isGeneric(generics) {
            return "\(escapedName).wrapAsGeneric()"
        }
        if (availability) {
            return "\(escapedName).typeErasedAttribute()"
        }
        return "\(escapedName)"
    }
    func wrappedForCalls(_ generics: [String], _ availability: Bool = false) -> String {
        if isGeneric(generics) {
            return "\(wrappedForCall).wrapAsGeneric()"
        }
        if (availability) {
            return "\(wrappedForCall).typeErasedAttribute()"
        }
        return "\(wrappedForCall)"
    }

    func asMethodArgument() -> String {
        if parameter.argumentLabel != parameter.name {
            return "\(parameter.argumentLabel ?? "_") \(parameter.name): \(parameter.typeName)"
        } else {
            return "\(parameter.name): \(parameter.typeName)"
        }
    }
    func labelAndName() -> String {
        let label = parameter.argumentLabel ?? "_"
        return label != parameter.name ? "\(label) \(parameter.name)" : label
    }
    func sanitizedForEnumCaseName() -> String {
        if let label = parameter.argumentLabel, label != parameter.name {
            return "\(label)_\(parameter.name)".replacingOccurrences(of: "`", with: "")
        } else {
            return "\(parameter.name)".replacingOccurrences(of: "`", with: "")
        }
    }
}
