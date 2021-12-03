function varargout = Take1(varargin)
% TAKE1 MATLAB code for Take1.fig
%      TAKE1, by itself, creates a new TAKE1 or raises the existing
%      singleton*.
%
%      H = TAKE1 returns the handle to a new TAKE1 or the handle to
%      the existing singleton*.
%
%      TAKE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TAKE1.M with the given input arguments.
%
%      TAKE1('Property','Value',...) creates a new TAKE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Take1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Take1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Take1

% Last Modified by GUIDE v2.5 05-Feb-2016 19:33:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Take1_OpeningFcn, ...
                   'gui_OutputFcn',  @Take1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Take1 is made visible.
function Take1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Take1 (see VARARGIN)

% Choose default command line output for Take1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Take1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Take1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=imgetfile()
a=imread(a);
setappdata(a);
