import React, { useState } from 'react';
import { Settings, MapPin, DollarSign, Bell, User, Shield, HelpCircle, LogOut } from 'lucide-react';

export function SettingsScreen() {
  const [preferences, setPreferences] = useState('balanced');
  const [notifications, setNotifications] = useState({
    performance: true,
    alerts: true,
    reports: false,
    maintenance: true,
  });

  return (
    <div className="flex flex-col gap-6 pb-6">
      {/* Header */}
      <div className="bg-gradient-to-br from-slate-900 via-slate-800 to-blue-900 text-white p-6 rounded-b-3xl">
        <div className="flex items-start justify-between">
          <div>
            <h1 className="text-2xl mb-1">Settings</h1>
            <p className="text-slate-300 text-sm">Manage your preferences</p>
          </div>
          <Settings className="w-6 h-6" />
        </div>
      </div>

      <div className="px-4 flex flex-col gap-4">
        {/* Site Details */}
        <div className="bg-white rounded-2xl border border-slate-200 p-4">
          <div className="flex items-center gap-2 mb-4">
            <MapPin className="w-5 h-5 text-slate-600" />
            <h3 className="text-slate-900">Site Details</h3>
          </div>
          <div className="space-y-3">
            <div>
              <label className="text-sm text-slate-600 block mb-1">Site Name</label>
              <input 
                type="text" 
                defaultValue="Residential Solar Array" 
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg text-slate-900"
              />
            </div>
            <div>
              <label className="text-sm text-slate-600 block mb-1">Location</label>
              <input 
                type="text" 
                defaultValue="Pretoria, Gauteng" 
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg text-slate-900"
              />
            </div>
            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="text-sm text-slate-600 block mb-1">System Size</label>
                <input 
                  type="text" 
                  defaultValue="8.4 kW" 
                  className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg text-slate-900"
                />
              </div>
              <div>
                <label className="text-sm text-slate-600 block mb-1">Panels</label>
                <input 
                  type="text" 
                  defaultValue="24" 
                  className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg text-slate-900"
                />
              </div>
            </div>
          </div>
        </div>

        {/* Energy Preferences */}
        <div className="bg-white rounded-2xl border border-slate-200 p-4">
          <div className="flex items-center gap-2 mb-4">
            <DollarSign className="w-5 h-5 text-slate-600" />
            <h3 className="text-slate-900">Energy Preferences</h3>
          </div>
          <div className="space-y-3">
            <div>
              <label className="text-sm text-slate-600 block mb-2">Optimization Goal</label>
              <div className="space-y-2">
                <label className="flex items-center gap-3 p-3 bg-slate-50 rounded-lg cursor-pointer">
                  <input 
                    type="radio" 
                    name="preference" 
                    value="cost"
                    checked={preferences === 'cost'}
                    onChange={(e) => setPreferences(e.target.value)}
                    className="w-4 h-4 text-emerald-600"
                  />
                  <div>
                    <div className="text-sm text-slate-900">Cost-Focused</div>
                    <div className="text-xs text-slate-500">Maximize financial savings</div>
                  </div>
                </label>
                <label className="flex items-center gap-3 p-3 bg-slate-50 rounded-lg cursor-pointer">
                  <input 
                    type="radio" 
                    name="preference" 
                    value="balanced"
                    checked={preferences === 'balanced'}
                    onChange={(e) => setPreferences(e.target.value)}
                    className="w-4 h-4 text-emerald-600"
                  />
                  <div>
                    <div className="text-sm text-slate-900">Balanced</div>
                    <div className="text-xs text-slate-500">Balance savings and lifespan</div>
                  </div>
                </label>
                <label className="flex items-center gap-3 p-3 bg-slate-50 rounded-lg cursor-pointer">
                  <input 
                    type="radio" 
                    name="preference" 
                    value="lifespan"
                    checked={preferences === 'lifespan'}
                    onChange={(e) => setPreferences(e.target.value)}
                    className="w-4 h-4 text-emerald-600"
                  />
                  <div>
                    <div className="text-sm text-slate-900">Lifespan-Focused</div>
                    <div className="text-xs text-slate-500">Optimize for system longevity</div>
                  </div>
                </label>
              </div>
            </div>
            <div>
              <label className="text-sm text-slate-600 block mb-1">Energy Rate (R/kWh)</label>
              <input 
                type="text" 
                defaultValue="R0.243" 
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg text-slate-900"
              />
            </div>
          </div>
        </div>

        {/* Notification Settings */}
        <div className="bg-white rounded-2xl border border-slate-200 p-4">
          <div className="flex items-center gap-2 mb-4">
            <Bell className="w-5 h-5 text-slate-600" />
            <h3 className="text-slate-900">Notifications</h3>
          </div>
          <div className="space-y-3">
            <label className="flex items-center justify-between">
              <div>
                <div className="text-sm text-slate-900">Performance Alerts</div>
                <div className="text-xs text-slate-500">Notify about system performance changes</div>
              </div>
              <input 
                type="checkbox" 
                checked={notifications.performance}
                onChange={(e) => setNotifications({...notifications, performance: e.target.checked})}
                className="w-5 h-5 text-emerald-600 rounded"
              />
            </label>
            <label className="flex items-center justify-between">
              <div>
                <div className="text-sm text-slate-900">Critical Alerts</div>
                <div className="text-xs text-slate-500">System errors and urgent issues</div>
              </div>
              <input 
                type="checkbox" 
                checked={notifications.alerts}
                onChange={(e) => setNotifications({...notifications, alerts: e.target.checked})}
                className="w-5 h-5 text-emerald-600 rounded"
              />
            </label>
            <label className="flex items-center justify-between">
              <div>
                <div className="text-sm text-slate-900">Monthly Reports</div>
                <div className="text-xs text-slate-500">Performance and savings summaries</div>
              </div>
              <input 
                type="checkbox" 
                checked={notifications.reports}
                onChange={(e) => setNotifications({...notifications, reports: e.target.checked})}
                className="w-5 h-5 text-emerald-600 rounded"
              />
            </label>
            <label className="flex items-center justify-between">
              <div>
                <div className="text-sm text-slate-900">Maintenance Reminders</div>
                <div className="text-xs text-slate-500">Scheduled maintenance notifications</div>
              </div>
              <input 
                type="checkbox" 
                checked={notifications.maintenance}
                onChange={(e) => setNotifications({...notifications, maintenance: e.target.checked})}
                className="w-5 h-5 text-emerald-600 rounded"
              />
            </label>
          </div>
        </div>

        {/* Account & Support */}
        <div className="bg-white rounded-2xl border border-slate-200 overflow-hidden">
          <button className="w-full flex items-center gap-3 p-4 hover:bg-slate-50 transition-colors border-b border-slate-200">
            <User className="w-5 h-5 text-slate-600" />
            <span className="text-slate-900">Account Information</span>
          </button>
          <button className="w-full flex items-center gap-3 p-4 hover:bg-slate-50 transition-colors border-b border-slate-200">
            <Shield className="w-5 h-5 text-slate-600" />
            <span className="text-slate-900">Privacy & Security</span>
          </button>
          <button className="w-full flex items-center gap-3 p-4 hover:bg-slate-50 transition-colors border-b border-slate-200">
            <HelpCircle className="w-5 h-5 text-slate-600" />
            <span className="text-slate-900">Help & Support</span>
          </button>
          <button className="w-full flex items-center gap-3 p-4 hover:bg-slate-50 transition-colors text-red-600">
            <LogOut className="w-5 h-5" />
            <span>Sign Out</span>
          </button>
        </div>

        {/* Platform Info */}
        <div className="bg-gradient-to-br from-blue-50 to-white rounded-2xl border border-blue-200 p-5">
          <div className="flex items-center gap-2 mb-3">
            <div className="w-8 h-8 bg-blue-100 rounded-lg flex items-center justify-center">
              <Settings className="w-4 h-4 text-blue-600" />
            </div>
            <h3 className="text-slate-900">Platform Performance</h3>
          </div>
          <div className="space-y-2 text-sm">
            <div className="flex items-center justify-between">
              <span className="text-slate-600">AI Uptime</span>
              <span className="text-emerald-600">99.97%</span>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-slate-600">Models Running</span>
              <span className="text-slate-900">8 active</span>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-slate-600">Data Points Analyzed</span>
              <span className="text-slate-900">2.4M+</span>
            </div>
            <div className="flex items-center justify-between">
              <span className="text-slate-600">Last Model Update</span>
              <span className="text-slate-900">4 hours ago</span>
            </div>
          </div>
        </div>

        {/* App Info */}
        <div className="bg-slate-50 rounded-xl p-4 text-center">
          <p className="text-xs text-slate-500">
            Ohwr v1.0.2 • AI-Powered Intelligence Platform
            <br />
            © 2026 Ohwr Energy Systems
            <br />
            <span className="text-emerald-600">Trusted by 12,400+ solar owners</span>
          </p>
        </div>
      </div>
    </div>
  );
}