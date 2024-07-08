import "@typespec/http";

using TypeSpec.Http;

model Store {
  name: string;
  address: Address;
}

model Address {
  street: string;
  city: string;
}

@route("/stores")
interface Stores {
  list(@query filter: string): Store[];
  read(@path id: Store): Store;
}

model User {
  @doc("ユーザーID")
  @maxLength(50)
  username: string;

  @doc("ユーザーのメールアドレス")
  @pattern("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
  email: string;

  @doc("ユーザーの年齢（18歳以上）")
  @minValue(18)
  age: int32;
}

interface Users {
	@get
	@route("/users")
	listUsers(limit?: int32, role?: string): User[];

	@get
	@route("/users/{userId}")
	getUser(userId: string): User;

	@post
	@route("/users")
	createUser(
		user: {
			name: string;
			email: string;
		},
	): User;

	@patch
	@route("/users/{userId}")
	updateUser(
		userId: string,
		user: {
			name?: string;
			email?: string;
		},
	): User;

	@delete
	@route("/users/{userId}")
	deleteUser(userId: string): void;
}
