import "@typespec/http";

using TypeSpec.Http;

@service({
	title: "User API",
})
namespace UserApi;

model User {
	id: string;
	name: string;
	email: string;
}

@route("/users")
interface Users {
	@get
	getUsers(): User[];

	@get
	@route("/{id}")
	getUser(@path id: string): User;
}
