import { App } from "astal/gtk4"
import style from "./style.scss"
import Bar from "./widget/Bar"

import { exec } from "astal/process"

App.start({
    requestHandler(request: string, res: (response: any) => void) {
        if (request == "say hi") {
            return res("hi cli")
        }
	if (request == "reload") {
		exec("sass --update ./style.scss /tmp/style.css")
		App.reset_css()
		App.apply_css("/tmp/style.css", true)
	}
    },
    css: style,
    main() {
        App.get_monitors().map(Bar)
    },
})
