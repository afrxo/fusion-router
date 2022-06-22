-- PubTypes
-- afrxo, 22.06.22

export type App = {
    use: (App, Router) -> (),
    mount: (App, Parent: Instance) -> (),
    unmount: () -> (),
    redirect: (App, Path: string, Props: table) -> ()
}

export type Context<T> = {
    app: App,
    path: string,
    props: T
}

export type Router = {
    path: string
}

export type ComponentFactory<Props> = (context: Context<Props>, props: Props) -> Instance

return 1