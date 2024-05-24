import ComposableArchitecture

extension PersistenceKeyDefault<DummyKey<Bool>> {
	public static let dummy = Self(
		DummyKey<Bool>(),
		false
	)
}

public struct DummyKey<Value>: Hashable, PersistenceReaderKey, Sendable {
	public func load(initialValue: Value?) -> Value? {
		initialValue
	}
}
