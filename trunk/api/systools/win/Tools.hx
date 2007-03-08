/*
 * Copyright (c) 2006, Edwin van Rijkom, Nicolas Cannasse
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

package systools.win;

class Tools {

	/// This only works on Windows
	static var check_os = switch( neko.Sys.systemName() ) { 
		case "Windows":	null; 
		default: throw "Windows is required to run systools.win.Tools"; 
	}

	public static function replaceExeIcon(exe: String, icon: String) : Bool {
		return if(_win_replace_exe_icon(untyped exe.__s, untyped icon.__s)) true else false;		
	}

	static var _win_replace_exe_icon = neko.Lib.load("systools","win_replace_exe_icon",2);
	
	public static function createProcess( app: String, cmds: String, workingdir: String, hide: Bool, wait: Bool): Int {
		return _win_create_process
			( untyped app.__s
			, untyped cmds.__s
			, untyped workingdir.__s
			, if (hide) 1 else 0
			, if (wait) 1 else 0
			);
	}
	static var _win_create_process = neko.Lib.load("systools","win_create_process",5);
	
	/**
	Retrieves the screen dimensions of the primary device and returns as an object with the
	fields h and w for height and width respectively
	**/
	public static function getScreenSize()
	{
		return _get_screen_size();
	}
	static var _get_screen_size = neko.Lib.load("systools","get_screen_size",0);

}